class FavoritesController < ApplicationController

  def create
    current_user.favorites.create(event_id: params[:event_id])
    redirect_to event_path(params[:event_id])
  end

  def destroy
    Favorite.find(params[:id]).destroy
  end
end
