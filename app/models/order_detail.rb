class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  def subtotal
   purchase_price * quantity
  end

<<<<<<< HEAD
  enum making_status: { not_yet: 0, waiting_production: 1, in_production: 2, complete_production: 3 }

=======
 enum production_status: { cannot_be_manufactured: 0, waiting_for_production: 1, production: 2, production_completed: 3 }
>>>>>>> 25dc696f54b6bcb2e095af0364a98f1cfce7c494
end
