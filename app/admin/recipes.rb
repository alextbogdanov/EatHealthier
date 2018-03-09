ActiveAdmin.register Recipe do
    permit_params :id, :title, :description, :image, :calories, :carbohydrates, :proteins, :fat, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy]
end
