class AddPaymentMethodToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :payment_method, :integer, null: false
  end
end
