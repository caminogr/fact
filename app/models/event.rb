class Event < ActiveRecord::Base
  has_many :events_users
  has_many :users, through: :events_users
  has_many :comments
  has_many :favorites

  acts_as_taggable_on :themes

  scope :owner, ->(id){ Event.find(id).users.first }

  validates :title,
            :sport,
            :fixed_number,
            :location,
            presence: :true
end
