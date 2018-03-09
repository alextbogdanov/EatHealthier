class AddUserIdToGoal < ActiveRecord::Migration[5.1]
  def change
    add_reference :goals, :user_id, foreign_key: true
  end
end
