class SmsClient
  cattr_accessor :client
  self.client = Twilio::REST::Client

  def initialize
    if Rails.env.test?
      @client = FakeSms.new
    else
      @client = self.class.client.new(
        ENV.fetch("TWILIO_SID"),
        ENV.fetch("TWILIO_AUTH_TOKEN"),
      )
    end
  end

  def send_message(from:, to:, body:)
    @client.messages.create(from: from, to: to, body: body)
  end
end