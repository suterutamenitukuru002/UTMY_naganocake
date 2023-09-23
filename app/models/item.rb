class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image


   scope :price_high_to_low, -> { order(price: :desc) }
   scope :price_low_to_high, -> { order(price: :asc) }
   has_many :cart_items, dependent: :destroy
end