class User < ActiveRecord::Base
  has_many :events
  has_many :participant
  has_many :participate_events, through: :participant, source: :event
  has_many :comments
  has_many :favorites

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :family_name,
            :first_name,
            :gender,
            :age,
            presence: :true
end
