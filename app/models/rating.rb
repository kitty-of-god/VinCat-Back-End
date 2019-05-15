class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product
  
  validates :comment, :rating, presence: true
end
