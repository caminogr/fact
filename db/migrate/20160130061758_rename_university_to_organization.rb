class RenameUniversityToOrganization < ActiveRecord::Migration
  def change
    rename_column :users, :university, :organization
  end
end
