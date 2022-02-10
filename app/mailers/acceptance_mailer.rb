class AcceptanceMailer < ApplicationMailer
  def acceptance_email
    @user = params[:user]
    @puzzle = params[:puzzle]

    mail(to: @user.email, subject: "Your request has been rejected")
  end
end
