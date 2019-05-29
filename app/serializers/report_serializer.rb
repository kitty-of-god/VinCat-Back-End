class ReportSerializer < ActiveModel::Serializer
  attributes :body, :reportable_id, :reportable_type
end
