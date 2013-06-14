require 'pry'
class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = 1
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id
    
      if @comment.save
        redirect_to "/posts/#{@post.id}", notice: "comment was created"
      else
        render "/posts/#{@post}/comments/new"
      end
    
  end
end