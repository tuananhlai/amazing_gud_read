class UserBooksController < ApplicationController
  def show
    @book = Book.includes(:authors).find_by id: params[:id]

    if @book.present?
      @review = @book.reviews.build
      @reviews = Review.rv_by_book params[:id]
    else
      not_found()
    end
  end
end
