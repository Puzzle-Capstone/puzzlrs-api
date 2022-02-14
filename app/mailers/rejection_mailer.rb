class RejectionMailer < ApplicationMailer
  def rejection_email
    @user = params[:user]
    @puzzle = params[:puzzle]

    mail(to: @user.email, subject: "Puzzlrs: Your request has been rejected")
  end
end
