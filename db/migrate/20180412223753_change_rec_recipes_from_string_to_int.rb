class ChangeRecRecipesFromStringToInt < ActiveRecord::Migration[5.1]
  def change
    drop_table :recommended_recipes
  end
end
