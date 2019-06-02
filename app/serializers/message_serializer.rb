# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :integer
#

class MessageSerializer < ActiveModel::Serializer
  attributes :text, :chat_id
end
