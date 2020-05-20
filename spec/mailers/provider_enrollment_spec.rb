require "rails_helper"

RSpec.describe ProviderEnrollmentMailer, type: :mailer do
  describe "request_confirmation" do
    let(:provider_enrollment) {create(:provider_enrollment)}
    let(:mail) { ProviderEnrollmentMailer.request_confirmation(provider_enrollment) }

    it "renders the headers" do
      expect(mail.subject).to eq("Request confirmation")
      expect(mail.to).to eq([provider_enrollment.practice_email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
