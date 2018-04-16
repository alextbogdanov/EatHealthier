class AddMealsAndDayToRecommendedRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recommended_recipes, :day, :date
  end
end
