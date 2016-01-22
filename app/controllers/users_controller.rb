class UsersController < ApplicationController

  before_action :set_event, only: [:favorite_events, :show]

  def favorite_events
    @events = @user.favorite_events
    render :show
  end

  def show
    @events = @user.events
    @following = current_user.active_relationships.find_by(following_id: @user) if user_signed_in?
  end

  private
    def set_event
      @user = User.find(params[:id])
    end
end
