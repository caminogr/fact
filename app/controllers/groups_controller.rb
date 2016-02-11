class GroupsController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:create]

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    render :new unless @group.save
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
