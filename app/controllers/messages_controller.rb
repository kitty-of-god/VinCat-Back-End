class MessagesController < ApplicationController
  
  acts_as_token_authentication_handler_for User #authentication
  
  #GET all
  def index
    @messages = Message.all
    render json: @messages
  end
  #GET /message/:id
  def show
    @message = Message.find(params[:id])
    render json: @message
  end

  def new
    @message = Message.new
  end

  def message_params
    params.require(:messages).permit(:text, :chat_id)
  end
  #POST
  def create
    @message = Message.new(message_params)
    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def message_param
    params.require(:message).permit(:text, :chat_id)
  end
  #PATCH/PUT /message/1
  def update
    @message = Message.find(params[:id])

    if @message.update_attributes(message_param)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end
  #DELETE /message/1
  def destroy
    Message.find(params[:id]).destroy
  end
end
