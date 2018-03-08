class AddTotalProteinsToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :total_proteins, :integer
  end
end
