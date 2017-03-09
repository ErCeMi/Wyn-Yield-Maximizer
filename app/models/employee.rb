class Employee < ApplicationRecord
  has_secure_password
  belongs_to :company
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      self.where(nil)
    end
  end
end
