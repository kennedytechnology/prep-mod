require "rails_helper"

RSpec.describe ClinicMailer, type: :mailer do
  describe "Public Clinic Created" do
    let(:user) { create(:user) }
    let(:clinic) { create(:clinic) }
    let(:mail) { ClinicMailer.public_clinic_created(user, clinic) }

    it "renders the headers" do
      expect(mail.subject).to eq("New Public Clinic Created")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(user.name)
    end
  end
end
