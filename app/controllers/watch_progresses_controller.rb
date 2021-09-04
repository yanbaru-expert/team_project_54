class WatchProgressesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    current_user.watch_progresses.create!(movie_id: @movie.id)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    current_user.watch_progresses.find_by(movie_id: @movie.id).destroy!
  end
end
