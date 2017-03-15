class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end

  # TODO
  # Add functionality to delete categories if time
  #
  # def destroy
  #   @category = Category.find params[:id]
  #   @category.destroy
  #   redirect_to [:admin, :categories], notice: 'category deleted!'
  # end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end

end
