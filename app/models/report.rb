class Report < ApplicationRecord
  belongs_to :repo, polymorphic: true

  
  validates :body, :type, presence: true
end
