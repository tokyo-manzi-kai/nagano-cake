class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def subtotal
   ordered_price * quantity
  end

 enum production_status: { not_yet: 0, waiting_production: 1, in_production: 2, complete_production: 3 }

end
