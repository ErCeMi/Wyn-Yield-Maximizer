class PropertyName < ApplicationRecord
  has_many :unit_types
  has_many :properties, through: :unit_types
end
