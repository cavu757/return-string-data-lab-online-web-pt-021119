class ProductsController < ApplicationController

  def index
    @products = Product.all
    @products2 = []
  end

  def create
    @create_error = ""
    new_product = Product.new(product_params)
    if new_product.save
      redirect_to products_path
    else
      @create_error = "Please enter valid information for product"
      render 'new'
    end
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

end
