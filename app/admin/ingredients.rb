ActiveAdmin.register Ingredient do
    permit_params :id, :name, :recipe_id
end
