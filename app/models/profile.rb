class Profile < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [ :name ]

  belongs_to :user

  validates :name, :avatar, presence: true, on: :step1
  validates :name, :avatar, presence: true, on: :update

  mount_uploader :avatar, AvatarUploader

  acts_as_taggable_on :categories, :materials, :moods, :genres, :themes

  def update_tags_from_user_posts
    return unless user.present?

    self.category_list = user.posts.flat_map(&:categories).uniq
    self.material_list = user.posts.flat_map(&:materials).uniq
    self.mood_list = user.posts.flat_map(&:moods).uniq
    self.genre_list = user.posts.flat_map(&:genres).uniq
    self.theme_list = user.posts.flat_map(&:themes).uniq

    save
  end

  def update_total_likes
    total = user.posts.sum(:likes_count) + user.collections.sum(:likes_count)
    puts total
    update!(total_likes: total)
  end

  # default_scope { order(created_at: "DESC") }
end
