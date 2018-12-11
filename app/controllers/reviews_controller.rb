class ReviewsController < ApplicationController
  before_action :authorize, :only => [:create, :destroy]

  def create
    @review = Review.new(params.require(:review).permit(:rating, :description))
    @review.user_id = current_user.id
    @review.product_id = params[:product_id].to_i
    puts @review
    if @review.save
      redirect_to @review.product
    else
      redirect_to @review.product
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :products
  end

  private

    def valid

    end

end
