class ReviewsController < ApplicationController
    def create
        @review = Review.new(review_params)
        list_id = params[:list_id]
        @review.list_id = list_id
        if @review.save
            redirect_to lists_path
        else 
            redirect_to list_path(list_id)
        end
    end

    private 

    def review_params
        params.require(:review).permit(:content, :rating)
    end
end
