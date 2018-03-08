class RenameUserIdOfGoal < ActiveRecord::Migration[5.1]
  def change
    rename_column :goals, :user_id_id, :user_id
  end
end
