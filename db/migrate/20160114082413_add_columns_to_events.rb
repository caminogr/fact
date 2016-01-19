class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :deadline, :datetime
    add_column :events, :fee, :string
  end
end
