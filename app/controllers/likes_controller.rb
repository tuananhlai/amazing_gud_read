class LikesController < ApplicationController
  before_action :has_login?
  before_action :find_review
  before_action :find_book
  before_action :find_like, only: [:destroy]

  def create
    _user_id = session[:user_id]

    if already_liked?
      flash[:notice] = "You already liked this review."
    else
      @review.review_likes.create(user_id: _user_id)
    end 

    redirect_to user_book_path(@book)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end

    redirect_to user_book_path(@book)
  end


  private

  def already_liked?
    ReviewLike.where(user_id: session[:user_id], review_id: params[:user_review_id]).exists?
  end

  def find_book
    @book = Book.find_by(id: @review[:book_id])
    if @book.nil?
      redirect_to root_path, notice: "Book doesn not exist."
    end
  end

  def find_review
    p params
    @review = Review.find_by(id: params[:user_review_id])
    if @review.nil?
      redirect_to root_path, notice: "Review does not exist."
    end
  end

  def find_like
    @like = @review.review_likes.find(params[:id])
    if @review.nil?
      redirect_to root_path
    end
  end

  # def review_like_params
  #   params.require(:review_like).permit(:review_id)
  # end
end
