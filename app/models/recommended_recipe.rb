class RecommendedRecipe < ApplicationRecord
    belongs_to :user, optional: true
end
