class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :account_name, null: false
      t.string :icon
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :tel, null: false
      t.string :shipping_address, null: false

      t.timestamps
    end
  end
end
