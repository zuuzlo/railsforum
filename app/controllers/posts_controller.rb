class PostsController < ApplicationController
  before_filter :set_categories
  before_filter :find_post, only: [:show, :update, :edit, :destroy]

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
    @post.user_id = 1
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

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
