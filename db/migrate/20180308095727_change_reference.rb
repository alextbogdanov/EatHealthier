class ChangeReference < ActiveRecord::Migration[5.1]
  def change
    change_column :table_name, :column_name, :new_type
  end
end
