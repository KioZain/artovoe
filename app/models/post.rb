class Post < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [ :title, :body, :author ]


  CATEGORIES = [ "ювелирка", "картина", "скульптура", "текстиль", "полиграфия", "диджитал-арт" ]
  before_validation :clean_tag_lists
  validates :title, presence: true
  validates :post_image, presence: true

  after_save :update_collections_tags_if_needed, :update_profile_tags
  before_destroy :update_collections_before_destroy, :update_profile_tags

  # validates :category_list, presence: true
  def update_likes_count
     update!(likes_count: likes.count)
   end
  # Associations-------------------------------

  has_many :likes, as: :likable
  has_many :favourites, as: :favouriteable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :displays, dependent: :destroy

  # accepts_nested_attributes_for :displays, allow_destroy: true, reject_if: ->(attrs) { attrs[:name].blank? }

  has_and_belongs_to_many :collections
  belongs_to :user

  # Post switching
  def next_post
    user.posts
        .where("created_at > ? OR (created_at = ? AND id > ?)", created_at, created_at, id)
        .order(created_at: :asc, id: :asc)
        .first
  end

  def previous_post
    user.posts
        .where("created_at < ? OR (created_at = ? AND id < ?)", created_at, created_at, id)
        .order(created_at: :desc, id: :desc)
        .first
  end

  def cyclic_next_post
    next_post || user.posts.order(created_at: :asc, id: :asc).first
  end

  def cyclic_previous_post
    previous_post || user.posts.order(created_at: :desc, id: :desc).first
  end
  # -----------------------------------------------------
  # acts_as_taggable_on :tags
  acts_as_taggable_on :categories, :materials, :moods, :genres, :themes

  # ImagesUploader----------------------------
  mount_uploader :post_image, PostImageUploader


  default_scope { order(created_at: "DESC") }

  private

  def clean_tag_lists
    self.material_list = material_list.reject(&:blank?) if material_list.present?
    self.genre_list = genre_list.reject(&:blank?) if genre_list.present?
    self.theme_list = theme_list.reject(&:blank?) if theme_list.present?
    self.mood_list = mood_list.reject(&:blank?) if mood_list.present?
  end

  def update_profile_tags
    profile = user.profile
    profile&.update_tags_from_user_posts
    # puts "Profile tags updated"
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
    # puts "Profile tags updated"
  end
end
