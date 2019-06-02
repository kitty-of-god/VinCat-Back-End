# == Schema Information
#
# Table name: sales
#
#  id             :integer          not null, primary key
#  date           :time
#  confirm_seller :boolean
#  confirm_buyer  :string
#  seller_user_id :integer
#  buyer_user_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  seller_id      :integer
#  buyer_id       :integer
#

require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
