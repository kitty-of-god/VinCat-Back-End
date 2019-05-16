class User < ApplicationRecord
  has_many :products
  has_many :sales
  has_many :reports , as::repo
  has_many :ratings, as::rate
  has_many :chat
  has_many :messages, through: chat
  has_one :cart
  has_one :image, as::imag
  
  validates :username, :name, :description, :password, :residence, presence: true
end
