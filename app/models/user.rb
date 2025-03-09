class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy

  after_create :create_user_profile


    def top_tag_names(limit = 12)
    ActsAsTaggableOn::Tag.joins(:taggings)
      .where(taggings: {
        taggable_type: "Post",
        taggable_id: posts.select(:id)
      })
      .group("tags.id")
      .order("COUNT(taggings.id) DESC")
      .limit(limit)
      .pluck(:name)
  end

  private

    def create_user_profile
      self.create_profile! unless self.profile.present?
    end
end
