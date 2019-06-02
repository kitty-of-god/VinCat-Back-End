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

  belongs_to :chat, optional: true
  
  validates :text, 
  length: { maximum: 200},
  presence: true
end
