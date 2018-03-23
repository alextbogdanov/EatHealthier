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

        @percent_of_total_carbs =  ((@total_carbohydrates.to_f / @total_nutrition.to_f * 100 * 1000).round / 1000.00)

        @percent_of_total_proteins = ((@total_proteins.to_f / @total_nutrition.to_f * 100 * 1000).round / 1000.00)
    
        @percent_of_total_fat = ((@total_fat.to_f / @total_nutrition.to_f * 100 * 1000).round / 1000.00)

        recommended_nutritions
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
end
