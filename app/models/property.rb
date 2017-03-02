class Property < ApplicationRecord
  belongs_to :company

  @prices = []
  @price_spread = []
  @vacant = Property.where(group: "Vacant Unrented")
  @notice = Property.where(group: "Notice Unrented")
  @available = @vacant + @notice
  @available.as_json(only: [:unit_rent])
  @available.each {|i| @prices << i["unit_rent"]}
  @prices.each {|i| @price_spread << i * 0.0225}


end
