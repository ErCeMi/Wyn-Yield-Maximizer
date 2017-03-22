class UnitType < ApplicationRecord
  has_many :properties
  belongs_to :property_name
end
