class OrderDetail < ApplicationRecord
    belongs_to :book
    belongs_to :order

    validates :order_id, presence: true
    validates :book_id, presence: true
    validates :price, presence: true
end
