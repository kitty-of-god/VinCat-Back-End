class CartsController < ApplicationController
  def list
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def new
    @cart = Cart.new
  end

  def cart_params
    params.require(:carts)
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def cart_param
    params.require(:cart)
  end

  def update
    @cart = Cart.find(params[:id])

    if @cart.update_attributes(book_param)
      redirect_to :action => 'show', :id => @cart
    end
  end

  def delete
    Cart.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
