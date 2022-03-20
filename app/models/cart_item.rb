class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :end_user

  def subtotal
    item.add_tax_price * quantity
  end

end
