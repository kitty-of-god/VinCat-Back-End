class ProductsController < ApplicationController
  acts_as_token_authentication_handler_for User, except: [ :show, :index, :getKind, :getByName, :product_rating, :getRatings, :productRating]
  #GET /products/getKind?kind=KIND "get products by kind"
  def getKind
    @products = Product.where("kind = ?", params[:kind]).available.PriceOrder.paginate(page: params[:page], per_page: 5)
    render json: @products
  end
  
  def getByName
    @products = Product.where("instr(name, ?) > 0", params[:name]).available.PriceOrder.paginate(page: params[:page], per_page: 5)
    render json: @products
  end
  
  #GET products/getRatings
  def getRatings
    @ratings = Rating.where("rateable_id = ? ",params[:id] ).where("rateable_type = 'Product'").paginate(page: params[:page], per_page: 5)
    render json: @ratings
  end
  
  #GET products/productRating
  def productRating
    @ratings = Rating.where("rateable_id = ? ",params[:id] ).where("rateable_type = 'Product'")
    n = 0.0
    rating = 0.0
    for i in @ratings do 
      rating += i.rating
      n+=1
    end
    rating = rating/n
    render json: rating
  end
  
    #GET products/getReports
  def getReports
    @ratings = Report.where("rateable_id = ? ",params[:id] ).where("rateable_type = 'Product'")
    render json: @ratings
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

  #POST
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created, location: @product
      @user = User.find(@product.user_id)
      ProductMailer.new_product(@user).deliver_now
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
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

private

  def product_params
    params.require(:products).permit(:name, :description, :price, :kind, :quantity, :new, :gender, :user_id)
  end
  
  def product_param
    params.require(:product).permit(:name, :description, :price, :kind, :state, :quantity, :new, :gender, :user_id, :sale_id)
  end