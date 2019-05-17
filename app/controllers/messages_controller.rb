class MessagesController < ApplicationController
  def list
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def message_params
    params.require(:messages)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def message_param
    params.require(:message)
  end

  def update
    @message = Message.find(params[:id])

    if @message.update_attributes(book_param)
      redirect_to :action => 'show', :id => @message
    end
  end

  def delete
    Message.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
