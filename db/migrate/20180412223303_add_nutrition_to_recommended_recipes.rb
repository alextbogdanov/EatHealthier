class AddNutritionToRecommendedRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recommended_recipes, :total_calories, :integer
    add_column :recommended_recipes, :total_proteins, :integer
    add_column :recommended_recipes, :total_fat, :integer
    add_column :recommended_recipes, :total_carbohydrates, :integer
  end
end
