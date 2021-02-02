class Review < ApplicationRecord
  belongs_to :idea
  belongs_to :user

  # many to many association
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :body, presence: {message: " should be present."}
end
