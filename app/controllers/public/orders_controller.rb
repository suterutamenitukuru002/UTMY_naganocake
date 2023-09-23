class Public::OrdersController < ApplicationController
  def new
    @order = Order.new(order_params)
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    @order.save
    redirect_to public_orders_check_path
  end

  def index
  end

  def show
  end

  def check
    @cart_items = current_customer.cart_items.all
    @shipping_fee = 800
    ary = []
      @cart_items.each do |cart_item|
    ary << cart_item.item.price * cart_item.amount
      @cart_items_price = ary.sum
      @total_price = @shipping_fee + @cart_items_price

        @selected_pay_method = params[:peyment_method]
        @selected_address = current_customer.postcode + " " + current_customer.address + " " + current_customer.family_name + current_customer.first_name
    end
  end

  def complete
  end

private

def order_params
  params.permit(:address_name, :address, :postcode, :payment_method, :billing_amount)
end

def address_params
  params.require(:order).permit(:name, :address, :postcode)
end

end
