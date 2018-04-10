class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :description, :inventory]

  def index
    @product = Product.all

  end

  def create
    @product = Product.create(product_params)
    # byebug
    redirect_to products_path
  end

  def show
    # @product = Product.find_by(id: params[:id])
  end

  def description
    # product = Product.find_by(id: params[:id])
    render plain: @product.description
  end

  def inventory
    render plain: @product.inventory && @product.inventory > 0 ? true : false
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
