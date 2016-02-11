class GroupsController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:create]

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @users = User.all
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
