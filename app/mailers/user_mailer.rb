require 'sib-api-v3-sdk'

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.Welcome.subject
  #
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to CHAZAQ: Take Heart in")

  #   # Initialize a new email
  #   @email = SibApiV3Sdk::SendSmtpEmail.new

  #   # Setup email attributes
  #   @email.to = [{ "email": @user.email }]

  #   @email.sender = {
  #     "name": "CHAZAQ",
  #     "email": "hey@chazaq.in"
  #   }
  #   @email.subject = "Welcome to CHAZAQ: Take Heart in"
  #   @email.reply_to = {
  #     "email": "hey@chazaq.in",
  #     "name": "CHAZAQ"
  #   }

  #   result = @send_in_blue.send_transac_email(@email)
  #   p result
  # rescue SibApiV3Sdk::ApiError => e
  #   puts "Exception when calling SMTPApi->send_transac_email: #{e}"
  end
end
