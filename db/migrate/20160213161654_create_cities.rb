class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer  :prefecture_id
      t.string   :name
      t.string   :name_kana
    end
    add_index :cities, :name
    add_index :cities, :name_kana
  end
end
