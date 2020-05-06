require "rails_helper"

RSpec.describe NewsSignupMailer, type: :mailer do
  describe "Successful Signup" do
    let(:news_signup) { create(:news_signup) }
    let(:mail) { NewsSignupMailer.successful_signup(news_signup) }

    it "renders the headers" do
      expect(mail.subject).to eq("Thank you for your subscription")
      expect(mail.to).to eq([news_signup.email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(news_signup.email)
    end
  end
end
