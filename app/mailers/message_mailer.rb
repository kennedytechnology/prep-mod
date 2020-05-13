class MessageMailer < ApplicationMailer

  def message_approved(message_to, message)
    @message = message
    mail(to: message_to, subject: @message.subject)
  end
end
