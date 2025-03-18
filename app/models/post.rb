class Post < ApplicationRecord
  TAGS = [ "cюрреализм", "нежность", "онтология", "природа", "повседневность", "философия", "жизнь", "шляпа", "семантика" ]
  CATEGORIES = [ "ювелирка", "картина", "скульптура", "текстиль", "полиграфия" ]

  # массив хешей
  # path и name
  # сюрреализм - name
  # sur - path
  #


  validates :title, presence: true
  validates :post_image, presence: true
  validates :category_list, presence: true

  # Associations-------------------------------

  has_many :likes, as: :likable

  def update_likes_count
    update(likes_count: likes.count)
  end

  has_many :comments, dependent: :destroy
  has_many :displays, dependent: :destroy

  accepts_nested_attributes_for :displays, allow_destroy: true, reject_if: :all_blank

  has_and_belongs_to_many :collections
  belongs_to :user

  acts_as_taggable_on :tags
  acts_as_taggable_on :categories

  # ImagesUploader----------------------------
  mount_uploader :post_image, PostImageUploader


  default_scope { order(created_at: "DESC") }
end
