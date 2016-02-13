require "csv"

CSV.foreach('db/prefectures.csv') do |row|
  Prefecture.create(:name => row[0], :name_kana => row[1])
end

CSV.foreach('db/cities.csv') do |row|
  City.create(:prefecture_id => row[0], :name => row[1], :name_kana => row[2])
end
