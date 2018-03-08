class ChangeFromIntToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :foods, :calories, :float
    change_column :foods, :proteins, :float
    change_column :foods, :carbohydrates, :float
    change_column :foods, :fat, :float

    change_column :meals, :total_calories, :float
    change_column :meals, :total_carbohydrates, :float
    change_column :meals, :total_fat, :float
    change_column :meals, :total_proteins, :float

    change_column :users, :recommended_calories_per_day, :float
    change_column :users, :recommended_carbohydrates_per_day, :float
    change_column :users, :recommended_proteins_per_day, :float
    change_column :users, :recommended_fat_per_day, :float
  end
end
