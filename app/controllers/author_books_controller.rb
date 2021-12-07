class AuthorBooksController < ApplicationController
  before_action :has_login?

  def index
    @author = Author.includes(:books).find_by id = params[:author_id]
  end
end