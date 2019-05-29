class ChatSerializer < ActiveModel::Serializer
  attributes :sender_id, :receiver_id
end
