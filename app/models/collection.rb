class Collection < ApplicationRecord
  TAGS = [ "cюрреализм", "нежность", "онтология", "природа", "повседневность", "философия", "жизнь", "шляпа", "семантика" ]
  CATEGORIES = [ "керамика", "картина", "скульптура", "текстиль", "полиграфия" ]

  has_and_belongs_to_many :posts
  belongs_to :user
  has_many :likes, as: :likable

  validate :must_have_at_least_two_posts


  acts_as_taggable_on :tags
  acts_as_taggable_on :categories


  private

  def must_have_at_least_two_posts
    if posts.size < 2
      errors.add(:base, "Коллекция должна содержать как минимум 2 поста.")
    end
  end
end
