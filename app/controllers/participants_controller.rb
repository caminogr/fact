class ParticipantsController < ApplicationController
  def create
    current_user.participants.create(event_id: params[:event_id])
    redirect_to event_path(params[:event_id])
  end
end
