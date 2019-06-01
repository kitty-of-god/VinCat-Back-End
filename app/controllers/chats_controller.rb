class ChatsController < ApplicationController
  acts_as_token_authentication_handler_for User#authentication
  #GET all
  def index
    @chats = Chat.all
    render json: @chats
  end
  #GET /chat/:id
  def show
    @chat = Chat.find(params[:id])
    render json: @chat
  end

  def new
    @chat = Chat.new
  end

  def chat_params
    params.require(:chats).permit(:sender_user_id, :receiver_user_id, :sender_id, :receiver_id)
  end
  #POST
  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      render json: @chat, status: :created, location: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def chat_param
    params.require(:chat).permit(:sender_user_id, :receiver_user_id, :sender_id, :receiver_id)
  end
  #PATCH/PUT /chat/1
  def update
    @chat = Chat.find(params[:id])

    if @chat.update_attributes(chat_param)
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end
  #DELETE /chat/1
  def destroy
    Chat.find(params[:id]).destroy
  end
end
