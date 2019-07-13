class ChatsController < ApplicationController
  acts_as_token_authentication_handler_for User#authentication
  #GET all
  def index

    @chats = Chat.all
    @users = User.all
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

  #POST
  def create
    if Chat.between(params[:sender_id],params[:recipient_id]).present?
      @chat = Chat.between(params[:sender_id], params[:recipient_id]).first
    else
      @chat = Chat.create!(chat_params)
    end
    redirect_to chat_messages_path(@chat)
  end

  def edit
    @chat = Chat.find(params[:id])
  end


  #PATCH/PUT /chat/1
  def update
    @chat = Chat.find(params[:id])

    if @chat.update_attributes(chat_params)
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

private

  def chat_params
    params.require(:chats).permit(:sender_id, :recipient_id)
  end

