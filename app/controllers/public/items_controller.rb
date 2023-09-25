class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(8)
      @items_all = @genre.items
    else
      @items = Item.page(params[:page]).per(8)
      @items_all = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end