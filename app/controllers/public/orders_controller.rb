class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.all
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:address_id] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:address_id] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name

    else params[:order][:address_id] == "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end

  　@cart_items = current_customer.cart_items.all
  　@order_new = Order.new

  end

  def create

  end

  def completion
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :shipping_fee, :billing_amount, :payment_method, :status)
  end

end
