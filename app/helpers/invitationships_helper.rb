module InvitationshipsHelper
  def already_invited?(invitable_user, event)
    Invitationship.where(invited_id: invitable_user, event_id: event).present?
  end
end
