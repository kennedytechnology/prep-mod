require "rails_helper"

RSpec.describe MessageMailer, type: :mailer do
  describe "Message Request Accepted" do
    let(:user) { create(:user) }
    let(:message) { create(:message) }
    let(:mail) { MessageMailer.message_approved(user.email, message) }

    it "renders the headers" do
      expect(mail.subject).to eq(message.subject)
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(message.subject)
      expect(mail.body.encoded).to match(message.body)
    end
  end
end
