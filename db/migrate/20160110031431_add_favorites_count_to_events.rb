class AddFavoritesCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :favorites_count, :integer, default: 0
  end
end
