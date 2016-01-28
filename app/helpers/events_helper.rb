module EventsHelper
  def invitable?(event)
    if current_user == event.owner && (event.status == "not_yet")
      return true
    end
  end
end
