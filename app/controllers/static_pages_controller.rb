class StaticPagesController < ApplicationController
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
    query = params["query"] || params["search"] # поддержка обоих параметров
    @items = PgSearch.multisearch(query) if query.present?
    @items ||= []
    puts @items.count

    @posts = @items.select { |i| i.searchable_type == "Post" }.map(&:searchable)
    @collections = @items.select { |i| i.searchable_type == "Collection" }.map(&:searchable)
    @profiles = @items.select { |i| i.searchable_type == "Profile" }.map(&:searchable)


    @default_tab = if @posts.any?
                     "tab1"
    elsif @collections.any?
                     "tab2"
    elsif @profiles.any?
                     "tab3"
    else
                     "tab1"
    end
  end
end
