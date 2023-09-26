class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders_all = Order.order(created_at: :desc)
    @orders = @orders_all.page(params[:page])
  end
end
