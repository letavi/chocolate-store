class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created success!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category was updated success!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    @category_products = @category.products
  end

  def destroy
    @category.destroy
    flash[:danger] = "Category was removed success!"
    redirect_to root_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
