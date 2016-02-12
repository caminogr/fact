class GroupsController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:create]
  def show
    @group = Group.find(params[:id])
    @events = @group.events
  end

  def new
    @group = Group.new
    @users = current_user.followers
  end

  def create
    @group = Group.new(group_params)
    @users = current_user.followers
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
