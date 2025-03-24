class Profile < ApplicationRecord
  belongs_to :user

  validates :name, :avatar, presence: true, on: :step1
  validates :name, :avatar, presence: true, on: :update

  mount_uploader :avatar, AvatarUploader


  def update_total_likes!
    total = posts.sum(:likes_count) + collections.sum(:likes_count)
    update!(total_likes: total)
  end

  # default_scope { order(created_at: "DESC") }
end
