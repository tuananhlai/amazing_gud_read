class GenreBooksController < ApplicationController
  before_action :has_login?

  def index
    @genre = Genre.includes(:books).find_by id = params[:genre_id]
  end
end