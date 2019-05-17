class ImageController < ApplicationController
  def list
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def image_params
    params.require(:images)
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def image_param
    params.require(:image)
  end

  def update
    @image = Image.find(params[:id])

    if @image.update_attributes(book_param)
      redirect_to :action => 'show', :id => @image
    end
  end

  def delete
    Image.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
