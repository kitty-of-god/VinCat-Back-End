class RatingsController < ApplicationController
  def list
    @ratings = Rating.all
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new
  end

  def rating_params
    params.require(:ratings)
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def rating_param
    params.require(:rating)
  end

  def update
    @rating = Rating.find(params[:id])

    if @rating.update_attributes(book_param)
      redirect_to :action => 'show', :id => @rating
    end
  end

  def delete
    Rating.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
