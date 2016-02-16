class City < ActiveRecord::Base
  belongs_to :prefecture

  has_many :events
end
