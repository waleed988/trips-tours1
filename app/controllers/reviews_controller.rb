class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user&.buyer?
      @review = Review.new
    else
      flash[:alert] = "You Dont Have Rights To Do Do This Action"
       render 'new' 
    end
  end
  def create
    if current_user&.buyer?
       @review = Review.create(review_params)
       @review.save
       if @review.save
         flash[:notice] = 'Review Submitted.'
         redirect_to root_url      
       else  
         flash[:notice] = 'Error Occured Please Try Again.'
         render 'new'
       end
     else
       flash[:alert] = "You Dont Have Rights To Do Do This Action"
       render 'new' 
     end
  end
  def index
    # @reviews = Review.all
  end
  private
  def review_params
    params.require(:review).permit(:message).merge(user_id: current_user.id)
  end
end
