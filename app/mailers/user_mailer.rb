class UserMailer < ApplicationMailer
  default from: "bishalmukherjee7@gmail.com"

  def calling_method
    @clients.each do |client|
      send_digest(client.email, client.name)
    end
  end
  
  def send_mail(client_email, client_name)
    mail(to: user_email, subject: user_name)
  end 
end
