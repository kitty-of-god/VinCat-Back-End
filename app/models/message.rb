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

class Message < ApplicationRecord

  belongs_to :chat
  belongs_to :user
  validates_presence_of :text, :chat_id, :user_id

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
