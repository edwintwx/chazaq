class ApplicationMailer < ActionMailer::Base
  default from: 'hey@chazaq.in'

  # def initialize
  #   @send_in_blue = SibApiV3Sdk::SMTPApi.new
  # end

  layout 'mailer'
end
