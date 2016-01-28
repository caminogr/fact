class InvitationshipsController < ApplicationController

  before_action :set_event, only: [:invitable, :create, :destroy]
  before_action :are_you_owner?, only: [:invitable, :create]

  def invitable
    @invitable_users = current_user.followers
  end

  def invited
    @user = User.find(params[:user_id])
    @invitationships = @user.passive_invitationships
  end

  def create
    current_user.active_invitationships.create(invited_id: params[:invited_id], event_id: params[:event_id])
    redirect_to action: :invitable
  end

  def destroy
    current_user.active_invitationships.find_by(invited_id: params[:id], event_id: @event).destroy
    redirect_to invitable_event_invitationships_path(@event)
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def are_you_owner?
    unless current_user == @event.owner
      redirect_to event_path(@event)
    end
  end
end
