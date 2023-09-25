class Admin::OrderDetailsController < ApplicationController
  def update
   @order_details = OrderDetail.find(params[:id])
   @order = @order_details.order
   @order_detail = @order.order_details.all

   is_updated = true
    if @order_details.update(order_detail_params)
       @order.update(status: "制作中") if @order_details.making_status == "制作中"
       @order_detail.each do |order_detail|
          if order_detail.making_status != "制作完了"
            is_updated = false
          end
    end
       @order.update(status: "発送準備中") if is_updated
    end
   redirect_to admin_order_path(@order_details.order)
  end


private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
