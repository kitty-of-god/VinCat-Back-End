class Message < ApplicationRecord
  has_one :user, through: :chat
  has_one :user, through: :chat
  has_one :chat
  
  validates :text, presence: true
end
