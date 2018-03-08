class CreateJoinTableMealFood < ActiveRecord::Migration[5.1]
  def change
    create_join_table :meals, :foods do |t|
      # t.index [:meal_id, :food_id]
      # t.index [:food_id, :meal_id]
    end
  end
end
