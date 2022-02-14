class MailerWorker
  include Sidekiq::Worker

  def perform(user, puzzle)
    RequestNotificationMailer.with(user: user, puzzle: puzzle).request_notification_email.deliver_now
  end
end
