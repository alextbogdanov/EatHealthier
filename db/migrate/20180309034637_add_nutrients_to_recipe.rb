class AddNutrientsToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :calories, :float
    add_column :recipes, :carbohydrates, :float
    add_column :recipes, :proteins, :float
    add_column :recipes, :fat, :float
  end
end
