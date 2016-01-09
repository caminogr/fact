class User < ActiveRecord::Base
  has_many :events_users
  has_many :events, through: :events_users
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :family_name,
            :first_name,
            :gender,
            :age,
            presence: :true
end
