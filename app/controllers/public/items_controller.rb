class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all

     if params[:latest]
      @sort = Item.latest
      elsif params[:price_high]
        @sort = Item.price_high
      elsif params[:price_low]
        @sort = Item.price_low
      else
        @sort = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end





end
