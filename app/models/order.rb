class Order < ApplicationRecord
  has_many :order_details
  belongs_to :end_user


enum method_of_payment: { credit_card: 0, transfer: 1 }
<<<<<<< HEAD
enum order_status: { waiting_deposit: 0, confirm_deposit: 1, in_production: 2, ready_ship: 3, complete_ship: 4 }
=======
enum order_status: { waiting_for_deposit: 0, payment_confirmation: 1, production: 2, ready_to_ship: 3, sent: 4 }
>>>>>>> 25dc696f54b6bcb2e095af0364a98f1cfce7c494

end
