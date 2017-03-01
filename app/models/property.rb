class Property < ApplicationRecord
  belongs_to :company

  @vacant = Property.where(group: "Vacant Unrented")
  @notice = Property.where(group: "Notice Unrented")
  @available = @vacant + @notice
  #@available.each { |i| }

  #def spread(price)
    #@spread = price * .025
#  end

end
