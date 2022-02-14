class AcceptanceMailer < ApplicationMailer
  def acceptance_email
    @user = params[:user]
    @puzzle = params[:puzzle]

    mail(to: @user.email, subject: "Puzzlrs: Your request has been accepted")
  end
end
