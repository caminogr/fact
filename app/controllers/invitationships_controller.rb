class InvitationshipsController < ApplicationController
  def invitable
    @event = Event.find(params[:event_id])
    @invitable_users = @event.owner.followers
  end
end
