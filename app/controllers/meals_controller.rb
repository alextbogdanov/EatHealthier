class MealsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_meal, only: [:show, :edit, :update, :destroy]

    def index
    end

    def new
        @meal = Meal.new
    end

    def create
        @meal = current_user.meals.new(meal_params)
        

        if @meal.save
            @today = Date.today

            @meal.update(total_calories: @meal.calc_total_calories, total_carbohydrates:    @meal.calc_total_carbohydrates, total_proteins: @meal.calc_total_proteins, total_fat: @meal.calc_total_fat, date: @today)


            redirect_to @meal, notice: "Successfully created meal."
        else
            render 'new'
        end
    end

    def show
    end

    def edit
        @meal_foods = @meal.meal_foods.includes(:food)
    end

    def update
        if @meal.update(meal_params)
            @meal.update(total_calories: @meal.calc_total_calories, total_carbohydrates:    @meal.calc_total_carbohydrates, total_proteins: @meal.calc_total_proteins, total_fat: @meal.calc_total_fat)

            redirect_to @meal, notice: "Successfully updated meal."
        else
            render 'edit'
        end
    end

    def destroy
        @meal.destroy
        redirect_to root_path, notice: "Successfully deleted meal."
    end

    private

    def find_meal
        @meal = Meal.where(user_id: current_user).find(params[:id])
    end

    def meal_params
        params.require(:meal).permit(:user_id, :meal_type, :date, :total_calories, :total_carbohydrates, :total_fat, food_ids:[])
    end
end
