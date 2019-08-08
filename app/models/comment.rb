class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

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
