require 'rails_helper'

RSpec.describe NewsSignupsController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new signup" do
        expect {
          post :create, params: { news_signup: {
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: Faker::Internet.email,
            date_of_birth: Faker::Date.birthday,
            zip_code: Faker::Address.zip_code,
            topics: ["Testing", "Screening", "Safety Kit", "Medication", "Other"],
            occupation: PATIENT_OCCUPATIONS.sample
          } }
        }.to change(NewsSignup, :count).by(1)
      end
    end
  end

  it do
    params = {
      news_signup: {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        date_of_birth: Faker::Date.birthday,
        zip_code: Faker::Address.zip_code,
        topics: ["Testing", "Screening", "Safety Kit", "Medication", "Other"],
        occupation: PATIENT_OCCUPATIONS.sample
      }
    }
    should permit(:first_name, :last_name, :email, :date_of_birth, :zip_code, :occupation, topics: []).
      for(:create, params: params).
      on(:news_signup)
  end
end
