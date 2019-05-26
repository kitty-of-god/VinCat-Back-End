class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show, :current]
  #GET all
  def index
    @users = User.all
    render json: @users
  end
  def current
    render json: current_user
  end
  #GET /user/:id
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def new
    @user = User.new
  end

  def user_params
    params.require(:users).permit(:username, :name, :email, :description, :password, :password_confirmation,:residence, :role)
  end
  #POST
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def user_param
    params.require(:user).permit(:username, :name, :description, :password, :residence, :role)
  end
  #PATCH/PUT /user/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_param)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  #DELETE /user/1
  def destroy
    User.find(params[:id]).destroy
  end
end
