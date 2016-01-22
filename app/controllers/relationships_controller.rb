class RelationshipsController < ApplicationController
  def create
    current_user.active_relationships.create(following_id: params[:user_id])
  end
end
