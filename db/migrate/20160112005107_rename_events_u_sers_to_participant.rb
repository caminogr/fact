class RenameEventsUSersToParticipant < ActiveRecord::Migration
  def change
    rename_table :events_users, :participant
  end
end
