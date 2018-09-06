class Subject < ApplicationRecord
  has_many :posts

  scope :sorted, lambda { order("numPosts ASC") }
end
