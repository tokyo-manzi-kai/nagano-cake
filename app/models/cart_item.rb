class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :end_user

  def subtotal
    item.price * quantity
  end

end
