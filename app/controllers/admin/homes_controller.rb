class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders, @selected = get_orders(params)
  end
end

