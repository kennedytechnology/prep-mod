class MessageMailer < ApplicationMailer

  def message_approved(message_to, message)
    @message = message

    I18n.with_locale(locale) do
      mail(to: message_to, subject: @message.subject)
    end
  end
end
