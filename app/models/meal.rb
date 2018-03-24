class Meal < ApplicationRecord
    belongs_to :user, optional: true
    has_many :meal_foods, dependent: :destroy
    has_many :foods, through: :meal_foods

    # Calculate database columns

    def calc_total_calories
        self.total_calories = self.foods.sum(:calories)
    end

    def calc_total_carbohydrates
        self.total_carbohydrates = self.foods.sum(:carbohydrates)
    end

    def calc_total_proteins
        self.total_proteins = self.foods.sum(:proteins)
    end

    def calc_total_fat
        self.total_fat = self.foods.sum(:fat)
    end

    # Calculate percentages of each nutrition 

    def calc_total_nutrition
        return self.total_carbohydrates + self.total_proteins + self.total_fat
    end

    def calc_percent_of_total_carbs
        return (self.total_carbohydrates.to_f / self.calc_total_nutrition.to_f * 100)
    end

    def calc_percent_of_total_proteins
        return (self.total_proteins.to_f / self.calc_total_nutrition.to_f * 100)
    end

    def calc_percent_of_total_fat
        return (self.total_fat.to_f / self.calc_total_nutrition.to_f * 100)
    end
end
