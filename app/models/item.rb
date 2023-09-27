class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  has_one_attached :image

  scope :latest, -> {order(created_at: :desc)}
  scope :price_high, -> { order(price: :desc) }
  scope :price_low, -> { order(price: :asc) }


  def total_price
  	item.price * amount
  end

  def with_tax_price
    (price * 1.1).floor
  end
end
