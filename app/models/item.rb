class Item < ApplicationRecord
  has_one_attached :item_image
  
  has_many :cart_items
  has_many :order_details
  belongs_to :genre
  
end
