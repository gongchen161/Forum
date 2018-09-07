class Subject < ApplicationRecord
  has_many :posts

  scope :sorted, lambda { order("numPosts ASC") }

  validates_presence_of :name
  validates :name, :uniqueness => true
end
