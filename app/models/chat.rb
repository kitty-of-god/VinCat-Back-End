class Chat < ApplicationRecord
  has_one :sender
  has_one :receiver
  has_many :messages
end
