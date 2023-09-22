class CartItem < ApplicationRecord
   belongs_to :item
   belongs_to :customer
   
   validates :amount, numericality: { only_integer: true 
   
   def subtotal
     item.tax_included_price * amount
   end
end
