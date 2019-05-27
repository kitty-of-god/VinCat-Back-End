class MessageSerializer < ActiveModel::Serializer
  attributes :text, :chat_id

    belongs_to :chat, optional: true

    validates :text,
    length: { maximum: 200},
    presence: true
end
