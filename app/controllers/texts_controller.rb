class TextsController < ApplicationController
  def index
    @texts = Text.where(genre: Text::RAILS_GENRE_LIST)
  end

  def show
    @texts = Text.find_by(id: params[:id])
  end
end
