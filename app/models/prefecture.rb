class Prefecture < ActiveRecord::Base

  self.primary_key = :prefecture_id

  has_many :cities
  has_many :events
end
