class AddPaymentMethodToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :paymeent_method, :integer, null: false
  end
end
