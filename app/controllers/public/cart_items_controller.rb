class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new
    # @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.item.price }
    @total = 0
  end

  def create
    if params[:cart_item][:amount] == ""
      #もし数量が空だったら、同じページに遷移する
      redirect_to item_path(params[:cart_item][:item_id])
      return
    end

    @cart_item = current_customer.cart_items.new(params_cart_item)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    elsif @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
  @cart_item = current_customer.cart_items.find(params[:id])
  # if @cart_item.update(params_cart_item)
  #   redirect_to cart_items_path
  @cart_item.update(params_cart_item)
   redirect_to cart_items_path

  end

  def destroy
    current_customer.cart_items.find(params[:id]).destroy
    redirect_to cart_items_path
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