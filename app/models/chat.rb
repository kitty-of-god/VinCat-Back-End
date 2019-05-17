class Chat < ApplicationRecord
  belongs_to :sender
  belongs_to :receiver
  has_many :messages, dependent: :destroy
end
