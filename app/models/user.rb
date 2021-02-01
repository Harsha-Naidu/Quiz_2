class User < ApplicationRecord
    # ASSOCIATION WITH IDEA MODEL
    has_many :ideas, dependent: :destroy

    validates :email,presence: {message: " should be present."},uniqueness: true 
    
    has_secure_password
end
