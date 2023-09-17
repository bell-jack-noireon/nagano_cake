class Admin::OrdersController < ApplicationController
  
   def top
    @order = current_customer.orders
   end
end
