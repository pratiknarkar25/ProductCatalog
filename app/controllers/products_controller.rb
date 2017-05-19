class ProductsController < ApplicationController
  before_action :set_type, only: [:new]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @type = product_params[:type] if product_params[:type].present?

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_type 
    @type = type 
  end

  def type 
    Product.types.include?(params[:type]) ? params[:type] : "Product"
  end

  def type_class 
    type.constantize 
  end

  def set_product
    @product = type_class.find(params[:id])
  end

  def product_params
    params.require(type.underscore.to_sym).permit(:name, :price, :inward_date, :type, :color) 
  end

end
