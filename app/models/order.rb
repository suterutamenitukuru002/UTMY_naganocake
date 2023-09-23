class Order < ApplicationRecord
  belongs_to :custmer
  has_many :order_details
  def full_name
    self.family_name + " " + self.first_name
  end
  enum order_status: { waiting: 0, paid_up: 1, in_maiking:2, preparing:3, shipped:4 }
end
