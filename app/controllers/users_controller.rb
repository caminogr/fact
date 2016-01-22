class UsersController < ApplicationController
  def favorite_events
    @user = User.find(params[:id])
    @events = @user.favorite_events
    render :show
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
  end
end
