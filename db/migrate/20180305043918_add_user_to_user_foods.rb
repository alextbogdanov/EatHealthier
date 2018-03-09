class AddUserToUserFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :user_foods, :user, :reference
  end
end
