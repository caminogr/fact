class FavoritesController < ApplicationController

  def create
    current_user.favorites.create(event_id: params[:event_id])
  end

end
