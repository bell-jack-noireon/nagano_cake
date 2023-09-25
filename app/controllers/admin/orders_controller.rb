class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
       @order_details.update_all(production_status: "waiting_for_production") if @order.status == "payment_confirmation"
    end
      redirect_to admin_order_path(@order)
  end

  private

   def order_params
     params.require(:order).permit(:status)
   end

end