class RelationshipsController < ApplicationController
  def following
    @following_users = User.find(params[:user_id]).following_users
  end

  def follower
    @followers = User.find(params[:user_id]).followers
  end

  def create
    current_user.active_relationships.create(followed_id: params[:user_id])
    redirect_to user_path(params[:user_id])
  end

  def destroy
    Relationship.find(params[:id]).destroy
    redirect_to user_path(params[:user_id])
  end
end
