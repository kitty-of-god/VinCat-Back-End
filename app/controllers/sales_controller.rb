class SalesController < ApplicationController

  acts_as_token_authentication_handler_for User #autentication

  #GET /sales/getDate?date=DATE "get sales by date"
  def getDate
    @sales = Sale.where("date = ?", params[:date])
    render json: @sales
  end

  #GET all
  def index
    @sales = Sale.all
    render json: @sales
  end
  #GET /sale/:id
  def show
    @sale = Sale.find(params[:id])
    render json: @sale
  end

  def new
    @sale = Sale.new
  end

  def sale_params
    params.require(:sales).permit(:date, :confirm_seller, :confirm_buyer, :seller_id, :buyer_id)
  end
  #POST
  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      render json: @sale, status: :created, location: @sale
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def sale_param
    params.require(:sale).permit(:date, :confirm_seller, :confirm_buyer, :seller_id, :buyer_id)
  end
  #PATCH/PUT /sale/1
  def update
    @sale = Sale.find(params[:id])

    if @sale.update_attributes(sale_param)
      render json: @sale
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end
  #DELETE /sale/1
  def destroy
    Sale.find(params[:id]).destroy
  end
end
