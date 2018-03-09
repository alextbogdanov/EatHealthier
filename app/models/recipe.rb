class Recipe < ApplicationRecord
    has_many :ingredients, dependent: :destroy
    has_many :directions, dependent: :destroy

    accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

    validates :title, :description, :image, presence: true

    # Paperclip
    has_attached_file :image, styles: { medium: "600x600>"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
