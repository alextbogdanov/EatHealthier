class AddHealthAttributesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :recommended_calories_per_day, :integer
    add_column :users, :recommended_carbohydrates_per_day, :integer
    add_column :users, :recommended_proteins_per_day, :integer
    add_column :users, :recommended_fat_per_day, :integer
  end
end
