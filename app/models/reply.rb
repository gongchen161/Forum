class Reply < ApplicationRecord
  belongs_to :post, { :optional => true }
  belongs_to :user, { :optional => true }

  scope :sorted, lambda { order("position ASC") }
end
