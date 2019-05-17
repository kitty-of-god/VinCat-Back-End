class Tag < ApplicationRecord

    
    validates :name,
    format: { with: /\A[\w]+\z/, message: "only allows numbers, letters" },
    length: { in: 2..25},
    presence: true
end
