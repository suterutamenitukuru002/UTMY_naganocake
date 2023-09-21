class Order < ApplicationRecord
  belongs_to :custmers
  enum order_status: { waiting: 0, paid_up: 1, in_maiking:2, preparing:3, shipped:4 }
end
