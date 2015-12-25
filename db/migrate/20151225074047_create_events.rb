class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text       :title
      t.string     :sport
      t.integer    :fixed_number
      t.text       :information
      t.timestamps
    end
  end
end
