class Item < ApplicationRecord
  
  TaxRate = 10
  #税抜価格＋消費税で税込価格
  def tax_incluted_price
    (price * (1 + TaxRate * 0.01)).floor
  end
  
end