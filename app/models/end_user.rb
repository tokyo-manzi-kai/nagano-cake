class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :shipping_addresses
  has_many :orders
  has_many :cart_items

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
