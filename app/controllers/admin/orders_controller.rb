class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    redirect_to admin_order_detail_path(@order)
  end
  
  private
  
end