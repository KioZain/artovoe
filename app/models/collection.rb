class Collection < ApplicationRecord
  # TAGS = [ "cюрреализм", "нежность", "онтология", "природа", "повседневность", "философия", "жизнь", "шляпа", "семантика" ]
  CATEGORIES = [ "керамика", "картина", "скульптура", "текстиль", "полиграфия" ]

  has_and_belongs_to_many :posts,  after_add: :update_tags_from_posts, after_remove: :update_tags_from_posts
  belongs_to :user
  has_many :likes, as: :likable

  # after_save :update_profile_total_likes
  # after_destroy :update_profile_total_likes

  validate :must_have_at_least_two_posts

  def update_likes_count
    update!(likes_count: likes.count)
  end

   def post_ids=(ids)
    super(ids.reject(&:blank?))
  end

  acts_as_taggable_on :categories, :materials, :moods, :genres, :themes


  def update_tags_from_posts(post = nil)
    self.material_list = posts.flat_map(&:materials).uniq
    self.mood_list = posts.flat_map(&:moods).uniq
    self.genre_list = posts.flat_map(&:genres).uniq
    self.theme_list = posts.flat_map(&:themes).uniq

    save
  end


  private

  def update_profile_total_likes
    user&.profile&.update_total_likes!
  end

  def must_have_at_least_two_posts
    if post_ids.size < 3
      errors.add(:base, "Коллекция должна содержать как минимум 3 поста.")
    end
  end
end
