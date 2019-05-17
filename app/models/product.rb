class Product < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :sale, optional: true
  belongs_to :cart, optional: true
  has_many :ratings, as: :rateable
  has_many :reports, as: :reportable
  has_many :image, as: :imageable
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
