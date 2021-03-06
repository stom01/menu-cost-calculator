class RecipeItem < ApplicationRecord
  ITEM_TYPES = %w(InventoryItem Recipe)
  validates :input_title, presence: true
  validates :item_type, inclusion: { in: ITEM_TYPES }, allow_blank: true
  validates :amount_value, presence: true
  validates :amount_unit, presence: true

  belongs_to :recipe
  belongs_to :item, polymorphic: true, optional: true 

  def nice_unit
    Unitwise(amount_value, amount_unit)
  end
end
