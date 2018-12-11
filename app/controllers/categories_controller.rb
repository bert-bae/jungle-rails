class CategoriesController < ApplicationController[5.2]

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end
end