class AddColumnsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :detail, :text
    add_column :groups, :image, :text
  end
end
