# lib/email_interceptor.rb
class EmailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to}#{message.subject}"
    message.to = [ 'edwintwx@gmail.com' ]
  end
end
