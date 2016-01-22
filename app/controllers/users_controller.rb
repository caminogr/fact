class UsersController < ApplicationController

  before_action :set_event, only: [:favorite_events, :show]

  def favorite_events
    @events = @user.favorite_events
    render :show
  end

  def show
    @events = @user.events
  end

  private
    def set_event
      @user = User.find(params[:id])
    end
end
