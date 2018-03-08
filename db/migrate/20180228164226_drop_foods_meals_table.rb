class DropFoodsMealsTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :foods_meals
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
