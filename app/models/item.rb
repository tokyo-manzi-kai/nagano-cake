class Item < ApplicationRecord
  has_many :order_details
  has_many :cart_items, dependent: :destroy

  #belongs_to :genre


end
