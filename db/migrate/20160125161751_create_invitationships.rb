class CreateInvitationships < ActiveRecord::Migration
  def change
    create_table :invitationships do |t|
      t.integer     :inviter_id
      t.integer     :invited_id
      t.integer     :event_id

      t.timestamps
    end
    add_index :invitationships, :inviter_id
    add_index :invitationships, :invited_id
  end
end
