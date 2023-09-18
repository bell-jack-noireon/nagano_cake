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
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "保存されました！"
    redirect_to admin_item_path(@item.id)
   else
     @item = Item.new
   render :new
   end
  end

  def update
  end
end
