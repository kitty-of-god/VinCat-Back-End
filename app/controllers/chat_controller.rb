class ChatController < ApplicationController
  def list
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def new
    @chat = Chat.new
  end

  def chat_params
    params.require(:chats)
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def chat_param
    params.require(:chat)
  end

  def update
    @chat = Chat.find(params[:id])

    if @chat.update_attributes(book_param)
      redirect_to :action => 'show', :id => @chat
    end
  end

  def delete
    Chat.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
