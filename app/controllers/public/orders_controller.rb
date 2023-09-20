class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.all
  end

  def confirm
  end

  def completion
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit()
  end

end
