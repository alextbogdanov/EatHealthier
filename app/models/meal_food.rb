class MealFood < ApplicationRecord
  belongs_to :meal
  belongs_to :food

  accepts_nested_attributes_for :food, :reject_if => :all_blank
end
