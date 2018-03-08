ActiveAdmin.register Food do
    permit_params :id, :name, :calories, :proteins, :carbohydrates, :fat
end
