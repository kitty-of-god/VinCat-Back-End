class Tag < ApplicationRecord
    belongs_to :product
    
    validates :name,
    format: { with: /\A[\w]+\z/, message: "only allows numbers, letters" },
    length: { in: 2..25},
    presence: true
end
