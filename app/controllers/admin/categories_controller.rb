class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @categories = Category.new
  end

  def create
    # @categories = Category.new(category_params)

    # if @categories.save
    #   redirect_to [:admin, :categories], notice: 'Category created!'
    # else
    #   render :new
    # end
  end

end
