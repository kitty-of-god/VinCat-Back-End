class TagsController < ApplicationController
  #GET all
  def index
    @tags = Tag.all.NameOrder
    render json: @tags
  end
  #GET /tag/:id
  def show
    @tag = Tag.find(params[:id])
    render json: @tag
  end
  
  def getByTag
    @tag = Tag.where("name = ?", params[:name])
    render json: @tag
  end

  def new
    @tag = Tag.new
  end

  def tag_params
    params.require(:tags).permit(:name)
  end
  #POST
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def tag_param
    params.require(:tag).permit(:name)
  end
  #PATCH/PUT /tag/1
  def update
    @tag = Tag.find(params[:id])

    if @tag.update_attributes(tag_param)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end
  #DELETE /tag/1
  def destroy
    Tag.find(params[:id]).destroy
  end
end
