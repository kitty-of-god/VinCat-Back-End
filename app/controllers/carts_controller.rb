class CartsController < ApplicationController
  
  acts_as_token_authentication_handler_for User#authentication
  
  #GET all
  def index
    @carts = Cart.all
    render json: @carts
  end
  #GET /cart/:id
  def show
    @cart = Cart.find(params[:id])
    render json: @cart
  end

  def new
    @cart = Cart.new
  end

  def cart_params
    params.require(:carts).permit(:user_id)
  end
  #POST
  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      render json: @cart, status: :created, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def cart_param
    params.require(:cart).permit(:user_id)
  end
  #PATCH/PUT /cart/1
  def update
    @cart = Cart.find(params[:id])

    if @cart.update_attributes(cart_param)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end
  #DELETE /cart/1
  def destroy
    Cart.find(params[:id]).destroy
  end
end
