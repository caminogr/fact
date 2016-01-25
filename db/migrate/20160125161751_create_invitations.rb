class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer     :inviter_id
      t.integer     :invited_id
      t.integer     :event_id
      t.integer     :status

      t.timestamps
    end
    add_index :invitations, :inviter_id
    add_index :invitations, :invited_id
    add_index :invitations, [:inviter_id, :invited_id], unique: true
  end
end
