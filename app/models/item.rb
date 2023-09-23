class Item < ApplicationRecord
  belongs_to :genre
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_one_attached :image


   scope :price_high_to_low, -> { order(price: :desc) }
   scope :price_low_to_high, -> { order(price: :asc) }


   def total_price
		item.price * amount
   end

   def with_tax_price
     (price * 1.1).floor
   end
end
