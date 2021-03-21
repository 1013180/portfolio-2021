class Plan < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :content, presence: true, length: { maximum: 200 }
end
