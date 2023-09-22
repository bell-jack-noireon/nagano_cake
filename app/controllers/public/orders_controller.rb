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
  　@total = @cart_items.inject(0) { |sum, item| sum + item.tax_incluted_price }
  　@order_new = Order.new

  end

  def create
    order_new = current_user.order.new(order_params)
    order_new.save
    @cart_items = current_user.cart_items.all
    @cart_items.each do |cart_item|
     @order_details = OrderDetails.new
     @order_details.order_id = order.id
     @order_details.item_id = cart_item.item.id
     @order_details.tax_inclede_price = cart_item.item.tax_included_price
     @order_details.amount = cart_item.amount
     @oeder_details.production_status = 0
     @order_details.save
    end

    CartItems.destroy_all
    redirect_to completion_orders_path

  end

  def completion
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :shipping_fee, :billing_amount, :payment_method, :status)
  end

end
