class Group < ActiveRecord::Base
  has_many :events
  has_many :groups_users
  has_many :users, through: :groups_users, source: :user

  validates :name,
            presence: :true
end
