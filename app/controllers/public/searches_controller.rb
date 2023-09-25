class Public::SearchesController < ApplicationController

  def genre_search
    @genre = params[:genre_id]
    @items = Item.where(genre_id: @genre_id)
  end

end
