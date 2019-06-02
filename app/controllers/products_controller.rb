class ProductsController < ApplicationController
  acts_as_token_authentication_handler_for User, except: [ :show, :index, :getKind, :getByName]
  #GET /products/getKind?kind=KIND "get products by kind"
  def getKind
    @products = Product.where("kind = ?", params[:kind]).available.PriceOrder.paginate(page: params[:page], per_page: 5)
    render json: @products
  end
  
  def getByName
    @products = Product.where("instr(name, ?) > 0", params[:name]).available.PriceOrder.paginate(page: params[:page], per_page: 5)
    render json: @products
  end
  
  #GET all
  def index
    @products = Product.all
    render json: @products
  end
  #GET /product/:id
  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def new
    @product = Product.new
  end

  def product_params
    params.require(:products).permit(:name, :description, :price, :kind, :quantity, :new, :gender, :user_id)
  end
  #POST
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def product_param
    params.require(:product).permit(:name, :description, :price, :kind, :state, :quantity, :new, :gender, :user_id, :sale_id)
  end
  #PATCH/PUT /product/1
  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_param)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
  #DELETE /product/1
  def destroy
    Product.find(params[:id]).destroy
  end
end
