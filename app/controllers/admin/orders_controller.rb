class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

 def update
   @orders = Order.find(params[:id])
   @order_details = @orders.order_details
   if @orders.update(order_params)
       @order_details.update_all(making_status: "制作待ち") if @orders.order_status == "入金確認"
   end
   redirect_to admin_order_path(@orders)
 end

private

 def order_params
   params.require(:order).permit(:order_status)
 end

end
