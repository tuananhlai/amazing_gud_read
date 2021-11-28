class AuthorsController < ApplicationController
  before_action :is_admin?

  def index
    @authors = Author.all
    @author = Author.new
  end
  
  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to authors_path
    else
      render :index
    end
  end
  
  def update
    @author = Author.find(params[:id])
    
    if @author.update(author_params)
      redirect_to authors_path
    else
      render :index
    end
  end
  
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

  private
    def author_params
      params.require(:author).permit(:name)
    end

    def is_admin?
      redirect_to root_path unless session[:user_role] == "admin"
    end
end
