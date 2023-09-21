class Item < ApplicationRecord
  has_one_attached :item_image

  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      item_image.attach(io: File.open(file_path), filename: 'no_image.png', content_type: 'image/png')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
  end
  
  TaxRate = 10
  #税抜価格＋消費税で税込価格
  def tax_incluted_price
    (price * (1 + TaxRate * 0.01)).floor
  end
  
end