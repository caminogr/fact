class GroupsController < ApplicationController
  before_action :set_group, only: :show
  before_action :not_group_member!, only: :show
  before_action :authenticate_user!, only: [:show, :new, :create]
  before_action :belongs_to_group?, only: :show

  skip_before_filter :verify_authenticity_token ,:only=>[:create]

  def show
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
  def set_group
    @group = Group.find(params[:id])
  end

  def not_group_member!
    redirect_to :back unless belongs_to_group?
  end

  def belongs_to_group?
    return true if @group.groups_users.find_by(user_id: current_user)
  end

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
