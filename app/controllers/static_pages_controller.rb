class StaticPagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :search
  def home
    @profiles_list = Profile.joins(user: :posts)
    .select("profiles.id, profiles.name, profiles.bio, profiles.user_id, profiles.total_likes, profiles.avatar, COUNT(posts.id) AS posts_count")
    .group("profiles.id, profiles.name, profiles.bio, profiles.user_id")
    .having("COUNT(posts.id) >= 4")
    .order("posts_count DESC")
    .limit(5)
    .to_a
    Rails.logger.info "------------------------Profiles loaded: #{@profiles_list.map(&:id)}----------------------------------"

    @top_posts = Post.order(likes_count: :desc).limit(6).includes(:user)
    @profiles = Profile.joins(:user).where(users: { id: @top_posts.pluck(:user_id) }).distinct
    @posts = Post.includes(:user)
  end

  def about
  end

  def output
  end

    def search
      @items = PgSearch.multisearch(params["search"])
      puts @items.count
    end
end
