class MoviesController < ApplicationController
  PER_PAGE = 12
  def index
    @movies = Movie.where(genre: Movie::RAILS_GENRE_LIST)
    @movies = Movie.page(params[:page]).per(PER_PAGE)
  end
end
