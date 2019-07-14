class ImagesController < ApplicationController
  #GET all
  def index
    @images = Image.all
    render json: @images
  end
  #GET /image/:id
  def show
    @image = Image.find(params[:id])
    render json: @image
  end

  def new
    @image = Image.new
  end

  def image_params
    params.require(:images).permit(:name, :imageable_id, :imageable_type, :photo)
  end
  #POST
  def create
    @image = Image.new(image_params)
    if @image.save
      render json: @image, status: :created, location: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def image_param
    params.require(:image).permit(:name, :imageable_id, :imageable_type, :photo)
  end
  #PATCH/PUT /image/1
  def update
    @image = Image.find(params[:id])

    if @image.update_attributes(image_param)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end
  #DELETE /image/1
  def destroy
    Image.find(params[:id]).destroy
  end
  
  def productImages
    @images = Image.where("imageable_type = 'Product'").order("created_at DESC")
    render json: @images
  end
end
