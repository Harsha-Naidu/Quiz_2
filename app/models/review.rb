class Review < ApplicationRecord
  belongs_to :idea
  belongs_to :user

  validates :body, presence: {message: " should be present."}
end
