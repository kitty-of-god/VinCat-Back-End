# == Schema Information
#
# Table name: reports
#
#  id              :integer          not null, primary key
#  body            :string
#  reportable_id   :integer
#  reportable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Report < ApplicationRecord
  belongs_to :reportable, polymorphic: true, optional: true



  validates :body,
  length: { maximum: 300},
  presence: true
  
end
