class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new
    @total_price = current_customer.cart_items.cart_items_total_price(@cart_items)
  end

  def create
    @cart_product = current_customer.cart_items.new(params_cart_item)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_product = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_product.amount += params[:cart_item][:amount].to_i
      cart_product.save
      redirect_to cart_items_path
    elsif @cart_product.save!
      redirect_to cart_items_path
    end
  end

  def destroy
    current_customer.cart_items.find(params[:id]).destroy
    redirect_to cart_products_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def params_cart_item
  params.require(:cart_item).permit(:amount, :item_id)
  end
end
