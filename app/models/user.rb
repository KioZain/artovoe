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

  private

    def create_user_profile
      self.create_profile! unless self.profile.present?
    end
end
