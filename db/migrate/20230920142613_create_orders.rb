class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :address, null: false, default: ""
      t.string :address_name, null: false, default: ""
      t.string :postcode, null: false, default: ""
      t.integer :payment_method, null: false, default: 0
      t.integer :billing_amount, null: false, default: ""
      t.integer :postage, null: false, default: ""
      t.integer :order_status, null: false, default: 0
      t.timestamps
    end
  end
end
