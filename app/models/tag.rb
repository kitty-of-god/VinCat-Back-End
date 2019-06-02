# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
    has_and_belongs_to_many :products
    
    #scopes
    scope :NameOrder, -> { order(name: :asc)}
    
    validates :name,
    format: { with: /\A[\S]+\z/, message: "only allows numbers, letters" },
    length: { in: 2..25},
    presence: true
end
