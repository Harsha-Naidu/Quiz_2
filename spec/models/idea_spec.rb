require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe "validates" do
    describe "title" do
    
      it "requires a title" do
        #given
        idea = FactoryBot.build(:idea, title: nil)
        #when 
        idea.valid?
        #then
        expect(idea.errors.messages).to(have_key(:title))
      end

      it 'title is unique' do
        persisted_idea= FactoryBot.create(:idea)
        idea=FactoryBot.build(:idea, title: persisted_idea.title) 
        idea.valid?
        expect(idea.errors.messages).to(have_key(:title))
      end

    end
  end

end
