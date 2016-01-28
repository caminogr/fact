class UsersController < ApplicationController

  before_action :set_event, only: :show

  def show
    @events = @user.events
    @following = current_user.active_relationships.find_by(followed_id: @user) if user_signed_in?
  end

  private
    def set_event
      @user = User.find(params[:id])
    end
end
