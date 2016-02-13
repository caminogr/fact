class Event < ActiveRecord::Base
  attr_accessor :start_time_hour

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  belongs_to :group

  has_many :participants
  has_many :participated_users, through: :participants, source: :user
  has_many :comments
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user

  scope :newer, -> {order(id: :desc)}
  scope :open, ->{ where(group_id: 0)}

  accepts_nested_attributes_for :participants

  acts_as_taggable_on :themes

  enum status: %i(not_yet expired)

  validates :title,
            :sport,
            :fixed_number,
            :location,
            presence: :true
end
