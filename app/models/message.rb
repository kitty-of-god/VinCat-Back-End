class Message < ApplicationRecord

  has_one :chat
  
  validates :text, 
  length: { maximum: 200},
  presence: true
end
