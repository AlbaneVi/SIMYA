module ApplicationHelper
  def opposite_parent_for(custody, user)
    user.child.parents.where.not(id: custody.user.id).first
  end
end
