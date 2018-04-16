class AddMealTypeToRecommendedRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recommended_recipes, :meal_type, :string
  end
end
