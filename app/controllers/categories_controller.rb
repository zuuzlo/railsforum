class CategoriesController < ApplicationController
  before_filter :set_categories

  def set_categories
    @categories = Category.all
  end

  def index
    @categories = Category.all
  end

  def show
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to @category, notice: "category successfully created"
    else
      render action: "new"
    end
  end
end