class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :seller_id, null: false, foreign_key: true
      t.string :title, null: false
      t.string :image
      t.string :product_condition, null: false
      t.string :description
      t.integer :price, null: false
      t.integer :postage, null: false
      t.boolean :published, null: false
      t.boolean :soldout, default: false, null: false

      t.timestamps
    end
  end
end
