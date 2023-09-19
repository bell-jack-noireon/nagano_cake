class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end
  
  def update
    @oder = Order.find(params[:id])
    @oder_details = OrderDetail.where(order_id: params[:id])
    redirect_to admin_order_detail_path(@order)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
end