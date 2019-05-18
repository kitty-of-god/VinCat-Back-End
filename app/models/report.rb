class Report < ApplicationRecord
  belongs_to :reportable, polymorphic: true, optional: true



  validates :body,
  length: { maximum: 200},
  presence: true
  
end
