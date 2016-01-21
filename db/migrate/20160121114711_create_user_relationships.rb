class CreateUserRelationships < ActiveRecord::Migration
  def change
    create_table :user_relationships do |t|
      t.integer    :user_id
      t.integer    :following_id

      t.timestamps
    end
    add_index :user_relationships, :user_id
    add_index :user_relationships, :following_id
    add_index :user_relationships, [:user_id, :following_id], unique: true
  end
end
