class TextsController < ApplicationController
  def index
    @texts = Text.where(genre: Text::RAILS_GENRE_LIST).includes(:read_progresses)
  end

  def show; end
end
