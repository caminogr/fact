module EventsHelper

  def participation_condition(event)
    "#{event.participants.count}/#{event.fixed_number}"
  end

  def invitable?(event)
    if current_user == event.owner && (event.status == "not_yet")
      return true
    end
  end
end
