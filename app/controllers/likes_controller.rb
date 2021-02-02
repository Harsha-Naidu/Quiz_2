class LikesController < ApplicationController
        def create
            review= Review.find params[:review_id] 
            like= Like.new review: review, user: current_user
            if !can?(:like, review)
                flash[:alert]='You can not like your own review'
            elsif like.save
                flash[:notice]='Review liked.'
            else
                flash[:alert]=like.errors.full_messages.join(', ')
            end
            redirect_to like.review.idea
        end
        def destroy
            like = current_user.likes.find params[:id]
            if !can?(:destroy, like)
                flash[:alert]= 'You can\'t destroy a like bcoz you don\'t own'
            elsif like.destroy
                flash[:notice]='Review unliked.' 
            else
                flash[:alert]='Couldn\'t unlike the review'
            end
            redirect_to like.review.idea
        end
    
end
