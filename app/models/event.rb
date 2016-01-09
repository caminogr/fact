class Event < ActiveRecord::Base
  has_many :events_users
  has_many :users, through: :events_users

  acts_as_taggable_on :themes

  scope :owner, ->(id){ Event.find(id).users.first }

  validates :title,
            :sport,
            :fixed_number,
            :location,
            presence: :true
end
