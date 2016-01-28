class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = @user.events
    @following = current_user.active_relationships.find_by(followed_id: @user) if user_signed_in?
  end
end
