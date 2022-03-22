class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  validates :name, presence: true
  validates :item_description, presence: true
  validates :price, numericality: {only_integer: true}


end
