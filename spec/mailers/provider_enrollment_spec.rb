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
      expect(mail.body.encoded).to match("#{provider_enrollment.first_name} #{provider_enrollment.last_name}")
    end
  end

  describe "email_provider_denial" do
    let(:provider_denial_message) { create(:provider_denial_message) }
    let(:provider_enrollment) { create(:provider_enrollment) }
    let(:mail) { ProviderEnrollmentMailer.email_provider_denial(provider_enrollment) }

    before do
      @message = provider_denial_message
    end

    it "renders the headers" do
      expect(mail.subject).to eq("Request to become a COVID-19 service srovider has been denied")
      expect(mail.to).to eq([provider_enrollment.practice_email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Request to become a COVID-19 service provider has been denied")
      expect(mail.body.encoded).to match(@message.body)
    end
  end

  describe "acceptance_confirmation" do
    let(:provider_enrollment) { create(:provider_enrollment) }
    let(:mail) { ProviderEnrollmentMailer.acceptance_confirmation(provider_enrollment, ) }

    it "renders the headers" do
      expect(mail.subject).to eq("Confirmation for your acceptance")
      expect(mail.to).to eq([provider_enrollment.practice_email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Your Regional Administrator will be in touch shortly. To inquire about our request call your state health department.")
    end
  end

end
