class ParticipantsController < ApplicationController
  def create
    current_user.participants.create(event_id: params[:event_id])
  end
end
