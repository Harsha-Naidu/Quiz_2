class ReviewsController < ApplicationController
    def create
        @ides = Idea.find params[:idea_id]
        @review=Review.new review_params
        @review.idea=@idea
        @review.user=current_user
    
        if @review.save
            redirect_to idea_path(@idea), notice: 'Review created !'
        else   
           @reviews=@idea.reviews.order(created_at: :desc)
           render '/ideas/show'
        end   
    end
    
    def destroy
        @idea=Idea.find params[:idea_id]
        @review=Review.find params[:id]
        @review.destroy
        redirect_to idea_path(@idea), notice: "Review deleted !"   
    end
    
    private
    def review_params
        params.require(:comment).permit(:body)
    end
end
