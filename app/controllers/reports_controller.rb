class ReportsController < ApplicationController
  before_action :has_login?
  before_action :find_review
  before_action :find_book

  def create
    _user_id = session[:user_id]

    @review.review_reports.create(user_id: _user_id, description: report_params()[:description]) 

    redirect_to user_book_path(@book)
  end
  
  private

  def find_book
    @book = Book.find_by(id: @review[:book_id])
    if @book.nil?
      redirect_to root_path, notice: "Book does not exist."
    end
  end

  def find_review
    p params
    @review = Review.find_by(id: params[:user_review_id])
    if @review.nil?
      redirect_to root_path, notice: "Review does not exist."
    end
  end

  def report_params
    params.require(:report).permit(:user_review_id, :id, :description)
  end
end
