class TagsController < ApplicationController
  def list
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def tag_params
    params.require(:tags)
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def tag_param
    params.require(:tag)
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update_attributes(book_param)
      redirect_to :action => 'show', :id => @tag
    end
  end

  def delete
    Tag.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
