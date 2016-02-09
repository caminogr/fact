class GroupsController < ApplicationController
  def new
    @group = Group.new
    @users = User.all
  end

  def search
    @users = User.where('family_name LIKE(?)', "%#{params[:keyword]}%")
  end
end
