class FavoritesController < ApplicationController

  def favorited_events
    @user = User.find(params[:id])
    @events = @user.favorite_events
    render action: "../users/show"
  end

  def create
    current_user.favorites.create(event_id: params[:event_id])
    redirect_to event_path(params[:event_id])
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to event_path(params[:event_id])
  end
end
