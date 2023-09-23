class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.find(params[:id])
    @order_details = Order_details.find(params[:id])
  end
 def update
   @orders = Order.find(params[:id])
   @orders.update(order_params)
   redirect_to admin_order_path(@order)
 end

private
 def order_params
   params.require(:order).permit(:order_status)
 end
end
