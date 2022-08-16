class CreateOrderingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :ordering_details do |t|

      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :production_status, null: false, defalt: 0

      t.timestamps
    end
  end
end
