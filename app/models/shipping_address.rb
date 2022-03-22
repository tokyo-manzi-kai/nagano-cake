class ShippingAddress < ApplicationRecord
  belongs_to :end_user

  validates :address, presence: true
  validates :address_name, presence: true
  validates :post_code, presence: true

end
