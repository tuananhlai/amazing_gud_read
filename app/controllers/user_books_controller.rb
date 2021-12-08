class UserBooksController < ApplicationController
  def show
    @book = Book.includes(:authors).find_by id: params[:id]
    @review = @book.reviews.build
    @reviews = Review.rv_by_book params[:id]
  end
end
