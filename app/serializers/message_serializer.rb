class MessageSerializer < ActiveModel::Serializer
  attributes :text, :chat_id
end
