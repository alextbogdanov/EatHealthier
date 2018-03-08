class AddUserToMeals < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :meals, :user, foreign_key: true
  end
end
