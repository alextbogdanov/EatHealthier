class RenameUserInUserFoods < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_foods, :user, :user_id
  end
end
