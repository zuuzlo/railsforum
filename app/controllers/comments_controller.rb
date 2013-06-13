require 'pry'
class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = 1
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id
    respond_to do |format|
      if @comment.save
        format.html {redirect_to "/posts/#{@post.id}", notice: "comment was created"}
      else
        # format.html {render "/posts/#{@post}/comments/new"}
      end
    end
  end
end