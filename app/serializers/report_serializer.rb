class ReportSerializer < ActiveModel::Serializer
  attributes :body, :reportable_id, :reportable_type

  belongs_to :reportable, polymorphic: true, optional: true

  validates :body,
  length: { maximum: 200},
  presence: true
end
