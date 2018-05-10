require 'rest-client'
class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
        @today = Date.today
        
        @breakfast = Meal.where(user_id: current_user, date: @today, meal_type: "Breakfast")
        @lunch = Meal.where(user_id: current_user, date: @today, meal_type: "Lunch")
        @dinner = Meal.where(user_id: current_user, date: @today, meal_type: "Dinner")
        @morning_snack = Meal.where(user_id: current_user, date: @today, meal_type: "Morning Snack")
        @afternoon_snack = Meal.where(user_id: current_user, date: @today, meal_type: "Afternoon Snack")
        @evening_snack = Meal.where(user_id: current_user, date: @today, meal_type: "Evening Snack")

        all_nutrients_from_meals

        @total_nutrition = @total_carbohydrates + @total_proteins + @total_fat

        @percent_of_total_carbs =  (@total_carbohydrates.to_f / @total_nutrition.to_f * 100)

        @percent_of_total_proteins = (@total_proteins.to_f / @total_nutrition.to_f * 100)
    
        @percent_of_total_fat = (@total_fat.to_f / @total_nutrition.to_f * 100)

        recommended_nutritions

        # Recommended Recipes

        recommended_recipes
    end

    def all_nutrients_from_meals
        @day = Meal.where(user_id: current_user, date: @today)

        @total_calories = 0
        @total_proteins = 0
        @total_carbohydrates = 0
        @total_fat = 0

        @day.each do |d|
            @total_calories += d.total_calories
            @total_proteins += d.total_proteins
            @total_carbohydrates += d.total_carbohydrates
            @total_fat = d.total_fat
        end
    end

    def recommended_nutritions
        @user = current_user
        @rec_total_calories = @user.recommended_calories_per_day
        @rec_total_carbohydrates = @user.recommended_carbohydrates_per_day
        @rec_total_proteins = @user.recommended_proteins_per_day
        @rec_total_fat = @user.recommended_fat_per_day

        @rec_total_nutrition = @rec_total_carbohydrates + @rec_total_proteins + @rec_total_fat

        @rec_percent_of_total_carbs = ((@rec_total_carbohydrates.to_f / @rec_total_nutrition.to_f * 100 * 1000).round / 1000.00)

        @rec_percent_of_total_proteins = ((@rec_total_proteins.to_f / @rec_total_nutrition.to_f * 100 * 1000).round / 1000.00)

        @rec_percent_of_total_fat = ((@rec_total_fat.to_f / @rec_total_nutrition.to_f * 100 * 1000).round / 1000.00)
    end

    def get_recommended_recipes
        response = RestClient.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/mealplans/generate?targetCalories=" + current_user.recommended_calories_per_day.to_s + "&timeFrame=day", headers={"X-Mashape-Key" => "agqlHIpiaOmsheRZvwYn20FulAyPp1MHH3PjsnIgR2lAenL75z",
            "Accept" => "application/json"})
        
        @parsedResponse = JSON.parse(response)
        @recRecipes = @parsedResponse['meals']

        @recRecipesNutrients = @parsedResponse['nutrients']
        @totalCalories = @recRecipesNutrients['calories'].to_f
        @totalProteins = @recRecipesNutrients['protein'].to_f
        @totalFat = @recRecipesNutrients['fat'].to_f
        @totalCarbohydrates = @recRecipesNutrients['carbohydrates'].to_f
    end

    def recommended_recipes
        @today = Date.today

        if user_signed_in?
        
        @queryRecipe = RecommendedRecipe.where(user_id: current_user.id, day: @today)
        
            if @queryRecipe.blank?
                get_recommended_recipes

                @newRecRecipe = RecommendedRecipe.create(meals_response: @recRecipes.to_json, total_calories: @totalCalories, total_proteins: @totalProteins, total_fat: @totalFat, total_carbohydrates: @totalCarbohydrates, day: @today, user_id: current_user.id)

                @newRecRecipe.save

                redirect_to(dashboard_path)
            
            else
                @recipeMeals = JSON.parse(@queryRecipe[0].meals_response)

                @recipeTotalCalories = @queryRecipe[0].total_calories
                @recipeTotalCarbs = @queryRecipe[0].total_carbohydrates
                @recipeTotalProteins = @queryRecipe[0].total_proteins
                @recipeTotalFat = @queryRecipe[0].total_fat

                if @queryRecipe[0].day != @today
                    get_recommended_recipes
                    @recRecipe.update(meals_response: @recRecipes, total_calories: @totalCalories, total_proteins: @totalProteins, total_fat: @totalFat, total_carbohydrates: @totalCarbohydrates, day: @today)
                end
            end
        end
    end
end
