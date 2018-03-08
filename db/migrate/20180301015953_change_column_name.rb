class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :meals, :type, :meal_type
  end
end
