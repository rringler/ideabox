class PagesController < ApplicationController
  def home
    @recent_ideas = Idea.recent(5)
  end

  def about
  end

  def contact
  end
end
