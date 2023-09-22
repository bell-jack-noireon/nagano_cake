class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    @order.update(order.params)
    redirect_to admin_order_path(@order)
  end
  
  private
  
   def order.params
     params.require(:order).permit(:status)
   end
   
end