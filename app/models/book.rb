class Book < ApplicationRecord
    scope :published, -> {where(published: true).order(created_at: :desc)}
    scope :unpublished, -> {where(published: false).order(created_at: :desc)}
    scope :keyword_search, ->(title) {where("title like ?", "%#{title}%")}

    mount_uploader :image, ImageUploader

    validates :title, presence: true
    validates :product_condition, presence: true
    validates :price, presence: true
    validates :postage, presence: true

    belongs_to :seller, class_name: 'User', foreign_key: :seller_id
    has_many :comments, dependent: :destroy
    has_many :book_categories
    has_many :categories, through: :book_categories
    has_many :favorites, dependent: :destroy

    #引数で渡されたユーザidがFavoritesテーブル内に存在するかどうかを調べるメソッド
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
    has_many :order_details, dependent: :destroy
end
