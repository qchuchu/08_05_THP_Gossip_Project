class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :tags
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true

  def is_liked?(user)
    liked = false
    self.likes.each do |like|
      liked = true if like.user == user
    end
    liked
  end

  def like_id(user)
    self.likes.find_by(user_id: user.id).id
  end

  def num_likes
    self.likes.count
  end
end
