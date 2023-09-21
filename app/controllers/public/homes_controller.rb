class Public::HomesController < ApplicationController
  def top
    # Item.allの記述が必要
    @item = Item.all
    # itemsの新着順にするコード追加する
    @ramdom = Item.order(sort_at: :desc).limit(4)
    # Genre.allの記述が必要
    @genres = Genre.where(is_active: true)
  end

  def about
  end
end
