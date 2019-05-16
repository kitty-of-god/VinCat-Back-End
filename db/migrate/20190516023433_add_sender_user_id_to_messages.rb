class AddSenderUserIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :sender_user_id, :integer
  end
end
