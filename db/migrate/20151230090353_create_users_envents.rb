class CreateUsersEnvents < ActiveRecord::Migration
  def change
    create_table :users_envents do |t|
      t.integer      :users_id
      t.integer      :events_id
      t.timestamps
    end
  end
end
