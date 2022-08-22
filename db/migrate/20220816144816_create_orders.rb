class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id, null: false
      t.string :delivery_postal_code, null: false
      t.string :delivery_address, null: false
      t.string :delivery_name, null: false
      t.integer :postage, null: false
      t.integer :total_amount_of_products, null: false
      t.integer :payment, null:false, default: 0
      t.integer :order_status, null: false, default: 0
      
      t.timestamps
    end
  end
end
