class AddReceiverUserIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :receiver_user_id, :integer
  end
end
