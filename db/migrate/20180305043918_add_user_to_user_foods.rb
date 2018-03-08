class AddUserToUserFoods < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :user_foods, :user, foreign_key: true
  end
end
