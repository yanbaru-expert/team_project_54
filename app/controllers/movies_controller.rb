class MoviesController < ApplicationController
  PER_PAGE = 12
  def index
    @movies = Movie.where(genre: Movie.genre_list(params[:genre])).page(params[:page]).per(PER_PAGE).includes(:watch_progresses)
  end
end
