require "rails_helper"

RSpec.describe PatientNotifierMailer, type: :mailer do
  describe "invitation" do
    let(:mail) { PatientNotifierMailer.invitation }

    it "renders the headers" do
      expect(mail.subject).to eq("Invitation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end