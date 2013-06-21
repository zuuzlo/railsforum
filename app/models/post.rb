class Post < ActiveRecord::Base
  belongs_to :user
  has_many :category_posts
  has_many :categories, through: :category_posts
  has_many :comments
  has_many :votes, as: :voteable
  validates :title, :url, presence: true

  def total_votes
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end
end