class GroupsController < ApplicationController
  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    render :new unless @group.save
  end

  def search
    @users = User.where('family_name LIKE(?)', "%#{params[:keyword]}%")
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
