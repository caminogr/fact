class Relationship < ActiveRecord::Base
  belongs_to :user, :follower, class_name: "User"
  belongs_to :user, :followed, class_name: "User"

  validate :follow_yourself?

  def follow_yourself?
    if follower_id == followed_id
       errors.add(:follower, "cant`t follow yourself")
    end
  end
end
