class Tag < ApplicationRecord
    
    validates :name,
    format: { with: /\A[\S]+\z/, message: "only allows numbers, letters" },
    length: { in: 2..25},
    presence: true
end
