class PostsController < ApplicationController
  def index
    @posts = Post.all
    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
    @categories = Category.all
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @post = Post.new
    @categories = Category.all
    @comment = Comment.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = 1
    @categories = Category.all
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
    @categories = Category.all    
  end

  def update
    @post = Post.find(params[:id])

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
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
