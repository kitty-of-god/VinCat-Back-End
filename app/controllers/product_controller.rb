class ProductController < ApplicationController
  def list
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def product_params
    params.require(:products)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def product_param
    params.require(:product)
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(book_param)
      redirect_to :action => 'show', :id => @product
    end
  end

  def delete
    Product.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
