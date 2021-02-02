class Like < ApplicationRecord
    belongs_to :user
    belongs_to :review

    # each user can like a review once
    validates(
        :review_id,
        uniqueness:{
            scope: :user_id,
            message: 'has already been liked'
        }
    )
end
