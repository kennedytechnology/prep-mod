require "rails_helper"

RSpec.describe EmployerMailer, type: :mailer do
  describe "request_confirmation" do
    let(:employer) {create(:employer)}
    let(:mail) { EmployerMailer.request_confirmation(employer) }

    it "renders the headers" do
      expect(mail.subject).to eq("Confirmation for your request to access information about your workplace")
      expect(mail.to).to eq([employer.email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Dear")
    end
  end
end
