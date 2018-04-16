class CreateRecommendedRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recommended_recipes do |t|
      t.string :meals_response
      t.integer :total_calories
      t.integer :total_proteins
      t.integer :total_fat
      t.integer :total_carbohydrates
      t.date :day

      t.timestamps
    end
  end
end
