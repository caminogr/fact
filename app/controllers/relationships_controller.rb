class RelationshipsController < ApplicationController
  def following
    @user = User.find(params[:user_id])
    @following_users = @user.following_users
    @nil = "見つかりませんでした" if @following_users.empty?
  end

  def follower
    @user = User.find(params[:user_id])
    @followers = @user.followers
    @nil = "見つかりませんでした" if @followers.empty?
  end

  def create
    current_user.active_relationships.create(followed_id: params[:user_id])
    redirect_to :back
  end

  def destroy
    Relationship.find(params[:id]).destroy
    redirect_to :back
  end
end
