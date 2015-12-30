class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text       :title
      t.string     :sport
      t.integer    :fixed_number
      t.integer    :status, default: 0
      t.text       :location
      t.text       :information
      t.datetime   :datetime
      t.timestamps
    end
  end
end
