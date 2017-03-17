class ReviewsController < ApplicationController
  before_filter :require_login

  def create
    product = Product.find_by(id: params[:product_id])
    @review = product.reviews.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to path_to_product, notice: "Review successfully submitted"
    else
      redirect_to path_to_product, notice: "Review incomplete: please choose a rating"
    end
  end

  def destroy
    @review = Product.find(params[:product_id]).reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(id: params[:product_id])
  end

  def path_to_product
    product_path(id: params[:product_id])
  end

  private
  def review_params
    params.require(:review).permit(:rating, :description, :product_id, :user_id)
  end

  def require_login
    redirect_to path_to_product unless current_user
  end
end
