class Favorite < ActiveRecord::Base
  belongs_to :event, counter_cache: :favorites_count
  belongs_to :user
end
