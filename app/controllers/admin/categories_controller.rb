class Admin::CategoriesController < ApplicationController
  before_filter :authorize
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(
      :name))
    puts @category
    if @category.save
      redirect_to [:admin, :categories], 
      notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
  end
end
