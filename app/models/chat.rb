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

class Chat < ApplicationRecord
  #belongs_to :sender, optional: true
  #belongs_to :receiver, optional: true
  has_many :messages, dependent: :destroy
end
