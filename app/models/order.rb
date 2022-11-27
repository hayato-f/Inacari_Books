class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    has_many :books, through: :order_details
    belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id

    validates :buyer_id, presence: true
    validates :shipping_address, presence: true, length: { maximum: 255}
    validates :subtotal, presence: true
    validates :postage, presence: true
    validates :total_price, presence: true
    validates :payment_method, presence: true
end
