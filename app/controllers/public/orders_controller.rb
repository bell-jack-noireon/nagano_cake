class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @address = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:address_id] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:address_id] == "1"
      @address = Address.find(params[:order][:address_select])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_id] == "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.item.tax_incluted_price*cart_item.amount }
    @order_new = Order.new

  end

  def create
    @order_new = current_customer.orders.new(order_params)
    if @order_new.save
      @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = @order_new.id
      @order_details.item_id = cart_item.item.id
      @order_details.tax_included_price = cart_item.item.tax_incluted_price
      @order_details.amount = cart_item.amount
      @order_details.save
     end
    current_customer.cart_items.destroy_all
    redirect_to completion_orders_path

    else
     @order = Order.new
     @address = current_customer.addresses.all
     flash[:alert] = "お届け先の入力内容に不備があります。"
     render :new
    end

  end

  def completion
  end

  def index
    @orders_all = current_customer.orders.order(created_at: :desc)
    @orders = @orders_all.page(params[:page]).per(8)
  end

  def show
    if params[:id] == "confirm"
      flash[:notice] = "画面遷移が行われました"
      redirect_to new_order_path
    else
     @order = Order.find(params[:id])
    end

  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :shipping_fee, :billing_amount, :payment_method, :status)
  end

end
