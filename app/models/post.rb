class Post < ApplicationRecord
  CATEGORIES = [ "ювелирка", "картина", "скульптура", "текстиль", "полиграфия", "диджитал-арт" ]

  validates :title, presence: true
  validates :post_image, presence: true

  after_save :update_collections_tags_if_needed, :update_profile_tags
  before_destroy :update_collections_before_destroy, :update_profile_tags

  # validates :category_list, presence: true

  # Associations-------------------------------

  has_many :likes, as: :likable


  def update_likes_count
    update!(likes_count: likes.count)
  end

  def next
    Post.unscoped do
      user.posts
        .where("created_at > ?", created_at)
        .reorder(created_at: :asc) # Используйте reorder вместо order
        .first || user.posts.reorder(created_at: :asc).first
    end
  end

  def previous
    Post.unscoped do
      user.posts
        .where("created_at < ?", created_at)
        .reorder(created_at: :desc)
        .first || user.posts.reorder(created_at: :desc).first
    end
  end

  # after_save :update_profile_total_likes
  # after_destroy :update_profile_total_likes

  has_many :comments, dependent: :destroy
  has_many :displays, dependent: :destroy

  accepts_nested_attributes_for :displays, allow_destroy: true, reject_if: :all_blank

  has_and_belongs_to_many :collections
  belongs_to :user

  # acts_as_taggable_on :tags
  acts_as_taggable_on :categories, :materials, :moods, :genres, :themes

  # ImagesUploader----------------------------
  mount_uploader :post_image, PostImageUploader


  default_scope { order(created_at: "DESC") }

  private

  def update_profile_tags
    profile = user.profile
    profile&.update_tags_from_user_posts
  end

  def update_collections_tags_if_needed
    if saved_change_to_category_list? || saved_change_to_material_list? ||
       saved_change_to_mood_list? || saved_change_to_genre_list? ||
       saved_change_to_theme_list?
      collections.each(&:update_tags_from_posts)
    end
  end

  def update_collections_before_destroy
    collections.each(&:update_tags_from_posts)
  end

   def update_profile_total_likes
    user&.profile&.update_total_likes!
  end
end
