class RequestNotificationMailer < ApplicationMailer
  default from: 'puzzlrmailer@gmail.com'

  def request_notification_email
    @user = params[:user]
    @puzzle = params[:puzzle]

    mail(to: @user.email, subject: "A request is in for one of your puzzles!")
  end
end
