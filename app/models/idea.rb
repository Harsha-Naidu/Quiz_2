class Idea < ApplicationRecord
    before_save :capitalize_title

    validates :title, presence: {message: 'must be provided'},uniqueness: true
    validates :description, presence: true, length:{minimum: 10, maximum: 200}

    # ASSOCIATION WITH USER MODEL
    belongs_to :user

    has_many :reviews, dependent: :destroy

    private
    
    def capitalize_title
        self.title.capitalize!
    end
end
