class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.string :type
      t.datetime :date
      t.integer :total_calories
      t.integer :total_carbohydrates
      t.integer :total_fat

      t.timestamps
    end
  end
end
