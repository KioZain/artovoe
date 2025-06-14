class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likable, polymorphic: true, counter_cache: :likes_count

   validates :user, uniqueness: { scope: [ :likable_type, :likable_id ] }

  after_create :update_likes_count
  after_destroy :update_likes_count

  private

  def update_likes_count
    return unless likable.present?
    likable.update_likes_count

    likable.user.profile.update_total_likes
  end
end
