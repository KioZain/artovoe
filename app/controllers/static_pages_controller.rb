class StaticPagesController < ApplicationController
  def home
    @posts = Post.includes(:user)
    @profiles = Profile.joins(:user).where("users.id IN (?)", @posts.pluck(:user_id)).distinct
  end

  def about
  end

  def output
  end
end
