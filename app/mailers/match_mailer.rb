class MatchMailer < ApplicationMailer
  default from: "Santa@northpole.donotreply.com"
   
  def match_mail(sender, receiver)
    @sender = sender
    @receiver = receiver
    mail(to: @sender.email, subject: "Message from Santa")
  end
end
