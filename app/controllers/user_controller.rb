class UserController < ApplicationController
  def list
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def user_params
    params.require(:users)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def user_param
    params.require(:user)
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(book_param)
      redirect_to :action => 'show', :id => @user
    end
  end

  def delete
    User.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
