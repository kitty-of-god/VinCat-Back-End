class Chat < ApplicationRecord
  has_one :user
  has_one :user
  has_many :messages
end
