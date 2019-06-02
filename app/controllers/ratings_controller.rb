class RatingsController < ApplicationController
  acts_as_token_authentication_handler_for User, except: [ :index, :show]  #kinda works
  #GET all
  def index
    @ratings = Rating.all
    render json: @ratings
  end
  #GET /rating/:id
  def show
    @rating = Rating.find(params[:id])
    render json: @rating
  end

  def new
    @rating = Rating.new
  end

  def rating_params
    params.require(:ratings).permit(:comment, :kind, :rating, :rateable_id, :rateable_type)
  end
  #POST
  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      render json: @rating, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def rating_param
    params.require(:rating).permit(:comment, :kind, :rating, :rateable_id, :rateable_type)
  end
  #PATCH/PUT /rating/1
  def update
    @rating = Rating.find(params[:id])

    if @rating.update_attributes(rating_param)
      render json: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end
  #DELETE /rating/1
  def destroy
    Rating.find(params[:id]).destroy
  end
end
