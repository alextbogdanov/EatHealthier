class RemoveIdColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :meal_foods, :id
  end
end
