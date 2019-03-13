class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product was created success!"
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    flash[:success] = "Product was updated success!"
    redirect_to products_path
  end

  def destroy
    @product.destroy
    flash[:danger] = "Product was removed success!"
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :image)
    end
end
