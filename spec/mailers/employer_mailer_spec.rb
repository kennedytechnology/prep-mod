require "rails_helper"

RSpec.describe EmployerMailer, type: :mailer do
  describe "request_confirmation" do
    let(:employer) {create(:employer)}
    let(:mail) { EmployerMailer.request_confirmation(employer) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your request to receive COVID-19 information about your constituents or employees has been submitted successfully.")
      expect(mail.to).to eq([employer.email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("To inquire about the status of your request, call your local or state health department.")
    end
  end
end
