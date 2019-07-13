class ReminderEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.sale_reminder_email(user).deliver_now
  end
end
