class CartItem < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :item, optional: true
  belongs_to :order, optional: true

	def add_item(item_id)
		current_item = items.find_by_item_id(item_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = items.build(item_id: item_id)
		end
		current_item
	end
	def total_price
		items.to_a.sum { |item| item.total_price }
	end

end
