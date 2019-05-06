class RecipeItem < ApplicationRecord
  ITEM_TYPES = %w Ingredient # HouseComponent
  validates :input_title
  validates :item_type, inclusion: { in: ITEM_TYPES }, allow_blank: true
  validates :amount, presence: true
  validates :measurement_id: presence: true

  belongs_to :recipe
  belongs_to :measurement
  belongs_to :item, polymorphic: true
end
