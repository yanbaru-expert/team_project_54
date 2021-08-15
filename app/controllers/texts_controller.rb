class TextsController < ApplicationController
  def index
    @texts = Text.where(genre: Text.genre_list(params[:genre]))
  end

  def show; end
end
