class Product < ApplicationRecord
  belongs_to :user
  belongs_to :sale
  belongs_to :cart
  has_many :reports
  has_one :image
  
  validates :name,
  format: { with: /\A[\w\s]+\z/, message: "only allows numbers, letters and spaces" },
  length: { in: 2..25},
  presence: true
  
  validates :description, 
  format: { with: /\A[\w\s]+\z/, message: "only allows numbers, letters and spaces" },
  length: {maximum: 200},
  presence: true
  
  validates :price,
  numericality: { greater_than: 0},
  presence: true
  
  validates :class,
  format: { with: /\A[\w]+\z/, message: "only allows numbers, letters" },
  length: { in: 2..25},
  presence: true
  
  validates :state,
  presence: true
  
  validates :quantity,
  numericality: { greater_than: 0},
  presence: true
  
  validates :new, 
  presence: true
end
