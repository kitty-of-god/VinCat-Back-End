# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  username    :string
#  name        :string
#  description :string
#  password    :string
#  residence   :string
#  role        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
