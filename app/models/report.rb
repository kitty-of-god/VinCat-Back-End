class Report < ApplicationRecord
  belongs_to :reportable, polymorphic: true



  validates :body,
  length: { maximum: 200},
  presence: true
  
  validates :type, #no definido
  presence: true
end
