class CreateMealFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_foods do |t|
      t.integer :meal, foreign_key: true
      t.integer :food, foreign_key: true

      t.timestamps
    end
  end
end
