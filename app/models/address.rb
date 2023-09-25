class Address < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true

  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end
end
