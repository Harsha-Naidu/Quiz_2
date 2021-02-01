class Idea < ApplicationRecord
    before_save :capitalize_title

    validates :title, presence: {message: 'must be provided'},uniqueness: true
    

    private
    
    def capitalize_title
        self.title.capitalize!
    end
end
