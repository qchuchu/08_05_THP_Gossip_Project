class Gossip < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :likes
  has_many :comments, as: :imageable
end
