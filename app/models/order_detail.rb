class OrderDetail < ApplicationRecord
  enum production_status: { unable_to_start: 0, waiting_for_production: 1, in_production: 2, production_completed: 3 }
  
  belongs_to :order
  belongs_to :item
  
  #数量ｘ税込価格で小計
  def subtotal
    amount * item.tax_incluted_price
  end
  
    #商品合計金額
  def billing_amount
    order_details.sum { |order_detail| order_detail.subtotal }
  end
end