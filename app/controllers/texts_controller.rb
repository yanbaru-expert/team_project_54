class TextsController < ApplicationController
  def index
    @texts = Text.where(genre: Text.genre_list(params[:genre])).includes(:read_progresses)
  end

  def show
    @texts = Text.find_by(id: params[:id])
  end
end
