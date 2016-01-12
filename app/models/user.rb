class User < ActiveRecord::Base
  has_many :events_users
  has_many :participate_events, through: :events_users, source: :event
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
