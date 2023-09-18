class CartItem < ApplicationRecord
   belongs_to :item
   belongs_to :customer
   belongs_to :order
   
   def subtotal
     item.tax_included_price * amount
   end
end
