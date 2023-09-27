class Admin::OrderDetailsController < ApplicationController
 def update
  @order_details = OrderDetail.find(params[:id])
  @order = @order_details.order
  @order_detail = @order.order_details.all

  is_updated = true
  if @order_details.update(order_detail_params)
    @order.update(order_status: "in_making") if @order_details.making_status == "in_making"
    @order_detail.each do |order_detail|
     if order_detail.making_status != "making_complete"
      is_updated = false
     end
  end
    @order.update(order_status: "preparing") if is_updated
  end
  redirect_to admin_order_path(@order)
 end


private
 def order_detail_params
  params.require(:order_detail).permit(:making_status)
 end
end