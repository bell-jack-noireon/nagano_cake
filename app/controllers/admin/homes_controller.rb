class Admin::HomesController < ApplicationController
  def top
    @orders = order.page(params[:page])
  end
end
