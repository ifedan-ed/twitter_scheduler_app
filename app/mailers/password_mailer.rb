class PasswordMailer < ApplicationMailer
  default from: "dan@danitex.com.ng"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)

    mail(
      subject: "Password Reset",
      to: params[:user].email,
      from: "dan@danitex.com.ng",
      message_stream: "outbound",
      track_opens: "true",
    )
  end
end
