class ReviewsController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    @review = product.reviews.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to product_path(id: params[:product_id]), notice: "Review successfully submitted"
    else
      redirect_to product_path(id: params[:product_id]), notice: "this didn't work"
    end
  end

  private

  def new_review
  end

  def review_params
    params.require(:review).permit(:rating, :description, :product_id, :user_id)
  end

end
