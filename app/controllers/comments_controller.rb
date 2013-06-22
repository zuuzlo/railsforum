class CommentsController < ApplicationController
  before_filter :require_user
  before_filter :find_comment, only: [:create, :vote]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user   
    
    if @comment.save
      redirect_to @post, notice: "Your comment was added."
    else
      @post.comments.reload
      render 'posts/show'
    end    
  end

  def vote
    Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
    flash[:notice] = "Your vote was counted"
    redirect_to :back
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end
end