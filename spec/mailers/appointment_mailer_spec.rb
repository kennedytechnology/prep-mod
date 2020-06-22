require "rails_helper"

RSpec.describe AppointmentMailer, type: :mailer do
  describe "patient_checked_in" do
    let(:appointment) {create(:appointment)}
    let(:mail) { AppointmentMailer.patient_checked_in(appointment) }

    it "renders the headers" do
      expect(mail.subject).to eq("You're Checked In!")
      expect(mail.to).to eq([appointment.patient.email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("We will text and/or email you when we're ready for you.")
    end
  end

  describe "send_reminder" do
    let(:appointment) {create(:appointment)}
    let(:mail) { AppointmentMailer.send_reminder(appointment) }

    it "renders the headers" do
      expect(mail.subject).to eq("Upcoming appointment reminder")
      expect(mail.to).to eq([appointment.patient.email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("#{ENV['SITE_URL']}/check_in/#{appointment.patient.check_in_code}")
    end
  end

  describe "patient_invited" do
    let(:appointment) { create(:appointment) }
    let(:mail) { AppointmentMailer.patient_invited(appointment) }

    it "renders the headers" do
      expect(mail.subject).to eq("You're Invited!")
      expect(mail.to).to eq([appointment.patient.email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("We're ready for you! Please come inside for your appointment.")
    end
  end

end