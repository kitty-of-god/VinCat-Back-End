class ProductsController < ApplicationController
  def list
    @products = Product.all
  end
  #GET /product
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def product_params
    params.require(:products)
  end
  #POST
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
  #PATCH/PUT /product/1
  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(book_param)
      redirect_to :action => 'show', :id => @product
    end
  end
  #DELETE /product/1
  def delete
    Product.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
