class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all

     if params[:latest]
      @items = Item.latest
      elsif params[:price_high]
        @items = Item.price_high
      elsif params[:price_low]
        @items = Item.price_low
      else
        @items = Item.all.page(params[:page])
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end





end
