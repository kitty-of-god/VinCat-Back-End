class Message < ApplicationRecord

  belongs_to :chat
  
  validates :text, 
  length: { maximum: 200},
  presence: true
end
