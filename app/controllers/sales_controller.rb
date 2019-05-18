class SalesController < ApplicationController
  def list
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
  end

  def sale_params
    params.require(:sales)
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def sale_param
    params.require(:sale)
  end

  def update
    @sale = Sale.find(params[:id])

    if @sale.update_attributes(book_param)
      redirect_to :action => 'show', :id => @sale
    end
  end

  def delete
    Sale.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
