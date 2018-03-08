class AddIdToMealFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :meal_foods, :id, :primary_key
  end
end
