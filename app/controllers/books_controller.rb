class BooksController < ApplicationController
  before_action :is_admin?

  def index
    @books = Book.all
    @book = Book.new
  end
    
  def create
    @book = Book.new book_params

    if @book.save
      redirect_to books_path
    else
      flash[:danger] = "Unable to create book"
      redirect_to books_path
    end
  end

  def destroy
    BookAuthor.where(:book_id => params[:id]).destroy_all
    @book = Book.find params[:id]
    @book.destroy

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :photo, :description, author_ids: [], genre_ids: [])
  end
end