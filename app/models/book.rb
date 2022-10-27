class Book < ApplicationRecord
    mount_uploader :image, ImageUploader

    validates :title, presence: true
    validates :product_condition, presence: true
    validates :price, presence: true
    validates :postage, presence: true

    belongs_to :user, foreign_key: :seller_id
    has_many :comments, dependent: :destroy
    has_many :book_categories
    has_many :categories, through: :book_categories
end
