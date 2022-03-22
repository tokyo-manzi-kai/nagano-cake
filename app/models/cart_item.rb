class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :end_user

  validates :quantity, numericality: { only_integer: true }

  def subtotal
    item.price * quantity
  end

end
