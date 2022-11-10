class User < ApplicationRecord
    before_save { self.email = email.downcase }
    mount_uploader :icon, IconUploader

    validates :name, presence: true
    validates :account_name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password_digest, presence: true, length: { minimum: 6 }
    validates :tel,  presence: true, length: { minimum: 10, maximum: 11 }
    validates :shipping_address, presence: true

    has_many :books, dependent: :destroy, foreign_key: :seller_id
    has_many :comments, dependent: :destroy

    has_many :orders, dependent: :destroy, foreign_key: :seller_id
    has_many :orders, dependent: :destroy, foreign_key: :buyer_id
end
