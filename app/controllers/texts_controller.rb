class TextsController < ApplicationController
  def index
    @text = Text.where(genre: Text::RAILS_GENRE_LIST)
  end

  def show; end
end
