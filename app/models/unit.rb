class Unit < ApplicationRecord
  belongs_to :property

  validates_presence_of :bedroom_count, :bathroom_count, :square_footage, :rent_price
end
