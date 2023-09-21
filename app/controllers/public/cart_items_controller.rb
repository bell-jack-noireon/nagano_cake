class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @cart_item_check = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
    if @cart_item_check
      @cart_item_check.amount += params[:cart_item][:amount].to_i
      @cart_item_check.save
      flash[:success] = "既にカートに入っている商品です"
      redirect_to cart_items_path
    else
