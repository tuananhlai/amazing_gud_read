class ReviewsController < ApplicationController
    before_action :is_admin?
  
    def index
      @reviews = Review.all
      @review = Review.new
    end
    
    def create
      @review = Review.new(review_params)
  
      if @review.save
        redirect_to reviews_path
      else
        render :index
      end
    end
    
    def destroy
      @review = Review.find(params[:id])
      @review.destroy
  
      redirect_to reviews_path
    end
  
    private
    
    def review_params
      params.require(:review).permit(:user_id [], :book_id [], :content, :rating)
    end
  end
  