class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.integer :proteins
      t.integer :carbohydrates
      t.integer :fat

      t.timestamps
    end
  end
end
