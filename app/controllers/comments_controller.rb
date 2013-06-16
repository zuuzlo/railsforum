class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = 1 #TODO fix this after authentication    
    
    if @comment.save
      redirect_to @post, notice: "Your comment was added."
    else
      @post.comments.reload
      render 'posts/show'
    end    
  end
end