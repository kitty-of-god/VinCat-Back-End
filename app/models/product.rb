class Product < ApplicationRecord
  belongs_to :user
  belongs_to :sale
  belongs_to :cart
  has_many :reports
  has_one :image
  
  validates :name,:description,:price,:class,:quantity, presence: true
end
