class Event < ActiveRecord::Base
  belongs_to :user, foreign_key: :owner_id

  has_many :participants
  has_many :participated_users, through: :participants, source: :user
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
