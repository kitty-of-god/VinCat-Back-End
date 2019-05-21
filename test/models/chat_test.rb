# == Schema Information
#
# Table name: chats
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  sender_user_id   :integer
#  receiver_user_id :integer
#  sender_id        :integer
#  receiver_id      :integer
#

require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
