class DropTablename < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_foods
  end
end
