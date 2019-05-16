class Product < ApplicationRecord
  belongs_to :user
  belongs_to :sale
  belongs_to :cart
  has_many :ratings, as::rate
  has_many :reports, as::repo
  has_one :image, as::imag
  has_many :tags
  
  validates :name,:description,:price,:class,:quantity, presence: true
end
