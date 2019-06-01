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

class ReportSerializer < ActiveModel::Serializer
  attributes :body, :reportable_id, :reportable_type
end
