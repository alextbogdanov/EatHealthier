ActiveAdmin.register User do
    permit_params :id, :email, :encrypted_password, :first_name, :last_name, :age, :height, :weight, :sex, :recommended_calories_per_day, :recommended_carbohydrates_per_day, :recommended_proteins_per_day, :recommended_fat_per_day
end
