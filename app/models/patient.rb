class Patient < ApplicationRecord
  has_many :insurance_types
  belongs_to :clinic

  def self.generate_access_code(size = 6)
    charset = %w{2 3 4 6 7 9 A C D E F G H J K M N P Q R T W X Y Z}
    charset.sample(size).join
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def sms_invite
    client = Twilio::REST::Client.new
    to_number = phone_number
    to_number = "+14075366339" if Rails.env.development?
    client.messages.create({
      from: ENV['TWILIO_FROM_PHONE'],
      to: to_number,
      body: "Your registration is complete. To schedule your COVID-19 test, go to #{ENV['SITE_URL']}/client/registration/#{access_code}"
    })
  end
end
