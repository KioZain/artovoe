class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likable, polymorphic: true, counter_cache: :likes_count

   validates :user, uniqueness: { scope: [ :likable_type, :likable_id ] }

  after_create_commit :update_likes_count
  after_destroy_commit :update_likes_count

  private

  def update_likes_count
    likable.update_likes_count
  end
end
