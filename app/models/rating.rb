class Rating < ApplicationRecord
  belongs_to :rate, polymorphic: true

  
  validates :comment, :rating, presence: true
end
