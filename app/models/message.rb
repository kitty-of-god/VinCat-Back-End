class Message < ApplicationRecord

  has_one :chat
  
  validates :text, presence: true
end
