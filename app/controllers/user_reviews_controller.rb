class UserReviewsController < ApplicationController
  def create
    @review = Review.new review_params
    @book = Book.find_by id: @review[:book_id]
    
    p @review
    if @review.save
      redirect_to user_book_path(@book)
    else
      @reviews = Review.rv_by_book @book.id
      render "user_books/show"
    end
  end

  private 

  def review_params
    params.require(:review).permit(:content, :rating, :book_id, :user_id)
  end
end
