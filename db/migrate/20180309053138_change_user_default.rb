class ChangeUserDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :recommended_calories_per_day, 0)
    change_column_default(:users, :recommended_carbohydrates_per_day, 0)
    change_column_default(:users, :recommended_proteins_per_day, 0)
    change_column_default(:users, :recommended_fat_per_day, 0)
  end
end
