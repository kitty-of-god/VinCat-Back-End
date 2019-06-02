# == Schema Information
#
# Table name: tag_products
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagProduct < ApplicationRecord
  belongs_to :tag
  belongs_to :product
end
