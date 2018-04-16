ActiveAdmin.register RecommendedRecipe do
    permit_params :id, :meals_response, :total_calories, :total_proteins, :total_fat, :total_carbohydrates, :day, :user_id
end
