class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { making_impossible: 0, making_pending: 1, in_maiking:2, making_complete:3 }
end
