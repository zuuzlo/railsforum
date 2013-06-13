class Post < ActiveRecord::Base
  attr_accessible :title, :url, :description
  belongs_to :user
  has_many :category_posts
  has_many :categories, through: :category_posts
  has_many :comments
  validates :title, :url, presence: true
end