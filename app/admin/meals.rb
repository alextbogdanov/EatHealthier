ActiveAdmin.register Meal do
    permit_params :id, :meal_type, :date, :total_calories, :total_carbohydrates, :total_fat, :user_id, :total_proteins
end
