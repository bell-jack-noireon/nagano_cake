class Order < ApplicationRecord
   belongs_to :customer
   has_many :order_details
# enum注文ステータスの値
   enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, preparation_for_shipping: 3, sent: 4 }
# enum支払方法
   enum payment_method: { credit_card: 0, bank_transfer: 1 }
end