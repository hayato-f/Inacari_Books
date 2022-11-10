class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :buyer_id, null: false 
      t.string :shipping_address, null: false
      t.integer :subtotal, null: false
      t.integer :postage, null: false
      t.integer :total_price, null: false
      t.integer :payment_method, null: false
      t.timestamps
    end
    add_foreign_key :orders, :users, column: :buyer_id
  end
end
