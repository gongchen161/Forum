class Post < ApplicationRecord
  belongs_to :subject, { :optional => true }
  belongs_to :user, { :optional => true }
  has_many :replies

  scope :sorted, lambda { order("position ASC") }
end
