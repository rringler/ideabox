class UserDecorator < Draper::Decorator
  delegate_all

  def recent_ideas
    object.ideas.recent
  end

  def recent_comments
    object.comments.recent
  end
end
