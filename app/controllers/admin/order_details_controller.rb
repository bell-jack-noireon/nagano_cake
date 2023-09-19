class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details.all

    redirect_to admin_order_path(@order)
  end





  private

  def order_details_params
    params.require(:order_detail).permit(:production_status)
  end

end