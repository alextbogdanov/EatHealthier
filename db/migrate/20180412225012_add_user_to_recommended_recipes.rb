class AddUserToRecommendedRecipes < ActiveRecord::Migration[5.1]
  def change
    add_reference :recommended_recipes, :user, foreign_key: true
  end
end
