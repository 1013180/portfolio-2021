class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shoe
  validates :comment, presence: true, length: { minimum: 1 }
end
