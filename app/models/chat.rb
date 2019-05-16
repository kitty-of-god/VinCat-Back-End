class Chat < ApplicationRecord
  has_one :sender_user, class_name: 'User', foreign_key: 'sender_user_id'
  has_one :receiver_user, class_name: 'User', foreign_key: 'receiver_user_id'
  has_many :messages
end
