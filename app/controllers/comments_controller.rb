class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = 1 #TODO fix this after authentication
    
    @comment.post_id = @post.id
    
      if @comment.save
        redirect_to post_path(@post), notice: "Your post was added."
      else
        render 'posts/show'
      end
    
  end
end