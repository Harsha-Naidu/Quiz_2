class User < ApplicationRecord
    # ASSOCIATION WITH IDEA MODEL
    has_many :ideas, dependent: :destroy
    # many to many association
    has_many :likes, dependent: :destroy 
    has_many :liked_reviews, through: :likes, source: :review


    validates :email,presence: {message: " should be present."},uniqueness: true 
    
    has_secure_password
end
