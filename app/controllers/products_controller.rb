class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def show
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      flash[:success] = "Product was created success!"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Product was updated success!"
      redirect_to product_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = @product.category
    @product.destroy
    flash[:danger] = "Product was removed success!"
    redirect_to @category
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :image, :category_id)
    end
end
