class AddUserIdToGoal < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :goals, :user_id, foreign_key: true
  end
end
