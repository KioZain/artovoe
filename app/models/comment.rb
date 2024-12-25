class Comment < ApplicationRecord
validates :body, presence: true, length: { minimum: 4 }

  belongs_to :post
  belongs_to :user
end
