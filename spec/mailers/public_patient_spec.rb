require "rails_helper"

RSpec.describe PublicPatientMailer, type: :mailer do

    describe "request_confirmation" do
      let(:patient) {create(:patient)}
      let(:mail) { PublicPatientMailer.request_confirmation(patient) }
  
      it "renders the headers" do
        expect(mail.subject).to eq("Confirmation for your request about COVID-19 testing.")
        expect(mail.to).to eq([patient.email])
        expect(mail.from).to eq(["notifications@clinicwizard.com"])
      end
  
      it "renders the body" do
        expect(mail.body.encoded).to match("Dear")
      end
    end  
end
