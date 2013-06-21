class PostsController < ApplicationController
  before_filter :find_post, only: [:show, :update, :edit, :destroy, :vote]
  before_filter :require_user, only: [:new, :create, :edit, :update]

  def set_categories
    @categories = Category.all
  end
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @post = Post.new
    @comment = Comment.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user
    respond_to do |format|
      if @post.save
        format.html {redirect_to @post, notice: "post was created"}
      else
        format.html {render action: "new"}
      end
    end
  end

  def edit
    @post = Post.find(params[:id])   
  end

  def update
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def vote
    Vote.create(voteable: @post, user: current_user, vote: params[:vote])
    flash[:notice] = "Your vote was counted"
    redirect_to :back
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
