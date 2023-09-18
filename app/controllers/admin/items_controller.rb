class Admin::ItemsController < ApplicationController
  def index
     @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show

  end

  def edit
  end

  def create
    @item = Item.new(item.params)
    if @item.save
    redirect_to admin_item_path(@item.id)
    else
    @items = Item.all
    render :new
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end

end
