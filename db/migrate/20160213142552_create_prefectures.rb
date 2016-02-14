class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.integer  :prefecture_id
      t.string   :name
      t.string   :name_kana
    end
  end
end
