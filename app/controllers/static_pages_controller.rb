class StaticPagesController < ApplicationController
  def home
    @top_posts = Post.order(likes_count: :desc).limit(6).includes(:user)
    @profiles = Profile.joins(:user).where(users: { id: @top_posts.pluck(:user_id) }).distinct
    @posts = Post.includes(:user)
  end

  def about
  end

  def output
  end
end
