class UsersController < ApplicationController
  def favorite_events
    @events = current_user.favorite_events
    render :show
  end

  def show
    @events = current_user.events
  end
end
