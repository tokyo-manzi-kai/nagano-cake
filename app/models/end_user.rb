class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :shipping_addresses
  has_many :orders
  has_many :cart_items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
