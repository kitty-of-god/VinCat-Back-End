class UsersController < ApplicationController
  acts_as_token_authentication_handler_for User, except: [ :create,:index, :show, :show_pdf]  #kinda works
  #before_action :authenticate_user, only: [:show, :current]
  #before_action :set_user, only: [:show, :update, :destroy]

  #GET /users/getRole?role=ROLE "get users by role"
  def getRole
    @users = User.where("role = ?", params[:role]).NameOrder
    render json: @users
  end

  #GET all
  def index
    @users = User.all.NameOrder
    render json: @users
  end
  
  #GET users
  def show_pdf
    @users = User.all
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render template:'users/reporte.pdf.erb', pdf: 'Reporte'
      #  render pdf: 'file'
      end
    end
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
    params.require(:users).permit(:username, :name, :email, :password, :password_confirmation, :role)
  end
  #POST
  def create
    if (params[:facebook] == true)
      response = HTTParty.get("https://graph.facebook.com/oauth/access_token_info?access_token=#{params[:userToken]}")
      if response.error.code == 190
        return
      end
        @user = User.new(username: params[:email],name: params[:email], email: params[:email],
                        password: Divise.friendly_token(length = 6), password_confirmation: Divise.friendly_token(length = 6), role: 'natural')
    else
      @user = User.new(user_params)
    end

    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def user_param
    params.require(:user).permit(:username, :name, :email, :description, :residence, :role)
  end
  
  #PATCH/PUT /user/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(username: params[:username], 
                                name: params[:name], email: params[:email], description: params[:description],
                                residence: params[:residence], role: params[:role])
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
