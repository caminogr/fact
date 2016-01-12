class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer    :owner_id
      t.string     :title
      t.string     :sport
      t.integer    :fixed_number
      t.integer    :status, default: 0
      t.string     :location
      t.text       :information
      t.datetime   :start_time
      t.datetime   :end_time
      t.timestamps
    end

    add_index :events, :owner_id
  end
end
