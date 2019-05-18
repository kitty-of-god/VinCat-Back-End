class Tag < ApplicationRecord
    has_and_belongs_to_many :products
    
    validates :name,
    format: { with: /\A[\S]+\z/, message: "only allows numbers, letters" },
    length: { in: 2..25},
    presence: true
end
