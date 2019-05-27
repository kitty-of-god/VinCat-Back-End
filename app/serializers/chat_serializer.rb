class ChatSerializer < ActiveModel::Serializer
  attributes :sender_id, :receiver_id

  belongs_to :sender, optional: true
  belongs_to :receiver, optional: true
  has_many :messages, dependent: :destroy
end
