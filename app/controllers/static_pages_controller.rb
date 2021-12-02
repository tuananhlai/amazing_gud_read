class StaticPagesController < ApplicationController
  def home
    @genres = Genre.all
  end
end