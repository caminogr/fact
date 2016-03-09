module RelationshipsHelper
  def find_relationship(user)
    current_user.active_relationships.find_by(followed_id: user)
  end
end
