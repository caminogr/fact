class AddColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :prefecture_id, :string
    add_column :events, :city_id, :string
  end
end
