class InvitationshipsController < ApplicationController
  def invitable
    @event = Event.find(params[:event_id])
    @invitable_users = @event.owner.followers
  end

  def invited
    @user = User.find(params[:user_id])
    @invitationships = @user.passive_invitationships
  end

  def create
    current_user.active_invitationships.create(invited_id: params[:invited_id], event_id: params[:event_id])
    redirect_to action: :invitable
  end
end
