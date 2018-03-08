class RenameTypeOfGoals < ActiveRecord::Migration[5.1]
  def change
    rename_column :goals, :type, :goal_type
  end
end
