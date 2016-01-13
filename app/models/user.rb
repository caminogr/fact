class User < ActiveRecord::Base
  has_many :events, foreign_key: :owner_id
  has_many :participants
  has_many :participate_events, through: :participants, source: :event
  has_many :comments
  has_many :favorites
  has_many :favorite_events, through: :favorites, source: :event

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :family_name,
            :first_name,
            :gender,
            :age,
            presence: :true
end
