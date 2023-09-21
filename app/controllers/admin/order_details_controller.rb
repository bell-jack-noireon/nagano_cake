class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)

    redirect_to admin_order_detail_path(@order)
  end

  private

    def order_detail_params
      params.require(:order_detail).permit(:production_status)
    end

end