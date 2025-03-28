class StaticPagesController < ApplicationController
  def home
    @top_posts = Post.order(likes_count: :desc).limit(6).includes(:user)
    @profiles = Profile.joins(:user).where(users: { id: @top_posts.pluck(:user_id) }).distinct
    @posts = Post.includes(:user)


    @profiles_list = Profile.joins(user: :posts)
      .select("profiles.*, COUNT(posts.id) AS posts_count")
      .group("profiles.id")
      .having("COUNT(posts.id) >= 4")
      .order("posts_count DESC")
      .limit(5)
      .includes(user: :posts)
  end

  def about
  end

  def output
  end
end
