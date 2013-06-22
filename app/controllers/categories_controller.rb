class CategoriesController < ApplicationController
  before_filter :require_user, only: [:new, :edit, :update]
  before_filter :get_categories

  def index
  end

  def show
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to '/categories', notice: "category successfully created"
    else
      render action: "new"
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to @category, notice: 'The category was succesfully updated'
    else
      render action: "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to category_url, notice: "category successfully deleted"
    else
      render action: "destroy", error: "there was a problem deleting the message"
    end
  end
end