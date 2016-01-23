class Relationship < ActiveRecord::Base
  belongs_to :user

  validate :follow_yourself?

  def follow_yourself?
    if user_id == following_id
       errors.add(:following, "cant`t follow yourself")
    end
  end
end
