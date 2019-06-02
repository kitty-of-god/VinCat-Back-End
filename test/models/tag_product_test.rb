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

require 'test_helper'

class TagProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
