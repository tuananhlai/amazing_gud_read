class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    @author = Author.new
  end
  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to "/authors"
    else
      render :index
    end
  end
  
  private
    def author_params
      params.require(:author).permit(:name)
    end
end
