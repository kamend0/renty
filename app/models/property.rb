class Property < ApplicationRecord
  has_many :units, dependent: :destroy, inverse_of: :property
  accepts_nested_attributes_for :units, reject_if: :all_blank, allow_destroy: true

  validates :address, presence: true
  validates :city, presence: true
  validates :state, inclusion: { in: US_STATE_ABBREVIATIONS }

  def num_units_string
    units.size.to_s + " unit" + (units.size == 1 ? "" : "s")
  end
end
