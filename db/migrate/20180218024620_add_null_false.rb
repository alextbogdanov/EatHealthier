class AddNullFalse < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
    change_column_null :users, :age, false
    change_column_null :users, :weight, false
    change_column_null :users, :height, false
    change_column_null :users, :sex, false
  end
end
