# == Schema Information
#
# Table name: chats
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  sender_user_id   :integer
#  receiver_user_id :integer
#  sender_id        :integer
#  receiver_id      :integer
#

class ChatSerializer < ActiveModel::Serializer
  attributes :sender_id, :receiver_id
end
