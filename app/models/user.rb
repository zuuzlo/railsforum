class User < ActiveRecord::Base
  attr_accessible :username
  has_many :posts
  has_many :comments
end