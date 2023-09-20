class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
   if @item.save
    redirect_to admin_item_path(@item)
   else
    @genres = Genre.all
    render :new
   end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end


  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
     redirect_to admin_item_path(@item)
    else
      @genres = Genre.all
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :body, :genre_id, :price, :is_sale, :item_image)
  end

end