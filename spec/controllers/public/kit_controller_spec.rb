require 'rails_helper'

RSpec.describe Public::KitController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new kit" do
        expect {
          post :create, params: { patient: {
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            middle_initial: ("A".."Z").to_a.sample,
            email: "kit@example.com",
            date_of_birth: Faker::Date.birthday,
            address: "3440 Brookhaven Road",
            city: "Pasadena",
            state: "MD",
            zip_code: 21122,
            county: COUNTIES.sample,
            phone_number: Faker::PhoneNumber.cell_phone,
            relation_to_patient_for_insurance: ["Self","Parent/Guardian","Other"].sample,
            consent_date: Date.today,
            occupation: PATIENT_OCCUPATIONS.sample,
            # race: US_STATES.sample,
          } }
        }.to change(Patient, :count).by(1)
        expect(response).to have_http_status(:redirect)
        expect(flash[:notice]).to eq("Your registration for a COVID-19 Safety Kit has been processed. Thank you.")
      end
    end
  end

  it do
    params = {
      patient: {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        middle_initial: ("A".."Z").to_a.sample,
        email: "kit@example.com",
        date_of_birth: Faker::Date.birthday,
        address: "3440 Brookhaven Road",
        city: "Pasadena",
        state: "MD",
        zip_code: 21122,
        county: COUNTIES.sample,
        phone_number: Faker::PhoneNumber.cell_phone,
        relation_to_patient_for_insurance: ["Self","Parent/Guardian","Other"].sample,
        consent_date: Date.today,
        occupation: PATIENT_OCCUPATIONS.sample,
      }
    }
    should permit(:county, :first_name, :middle_initial, :last_name, :address,
        :state, :city, :zip_code, :number_of_adults,
        :number_of_children, :email, :phone_number,
        :relation_to_patient_for_insurance, :consent_date,
        :occupation, :date_of_birth, :race).
      for(:create, params: params).
      on(:patient)
  end
end
