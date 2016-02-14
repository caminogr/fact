require "csv"

CSV.foreach('db/prefectures.csv') do |row|
  Prefecture.create(:prefecture_id => row[0], :name => row[1], :name_kana => row[2])
end

CSV.foreach('db/cities.csv') do |row|
  City.create(:prefecture_id => row[0], :name => row[1], :name_kana => row[2])
end
