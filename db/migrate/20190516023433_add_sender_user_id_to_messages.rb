class AddSenderUserIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :sender_user_id, :integer
  end
end
