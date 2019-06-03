class AddSenderAndReceiverToChats < ActiveRecord::Migration[5.2]
  def change
    #add_reference :chats, :sender, user: true, foreign_key: true
    #add_reference :chats, :receiver, user: true, foreign_key: true
  end
end
