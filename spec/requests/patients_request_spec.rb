require 'rails_helper'

RSpec.describe "Patients", type: :request do
  # let(:clinic) { create(:clinic) }
  before do 
    clinic = create(:clinic)
    sign_in create(:user)
  end

  let(:valid_attributes) {
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      middle_initial: ("A".."Z").to_a.sample,
      email: "patient@example.com",
      date_of_birth: Faker::Date.birthday,
      address: "3440 Brookhaven Road",
      city: "Pasadena",
      state: "MD",
      zip_code: 21122,
      county: COUNTIES.sample,
      phone_number: Faker::PhoneNumber.cell_phone,
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "returns http success" do
      get patients_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      patient = Patient.create! valid_attributes
      get patient_url(patient)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_patient_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new patient" do
        expect {
          post patients_url, params: { patient: valid_attributes }
        }.to change(Patient, :count).by(1)
      end

      it "redirects to root" do
        post patients_url, params: { patient: valid_attributes }
        expect(response).to redirect_to(patients_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new patient" do
        expect {
          post patients_url, params: { patient: attributes_for(:patient, first_name: "") }
        }.to change(Patient, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post patients_url, params: { patient: attributes_for(:patient) }
        expect(response).to redirect_to(patients_url)
      end
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      patient = Patient.create! valid_attributes
      get edit_patient_url(patient)
      expect(response).to be_successful
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested patient" do
      patient = Patient.create! valid_attributes
      expect {
        delete patient_url(patient)
      }.to change(Patient, :count).by(-1)
    end

    it "redirects to clinics" do
      patient = Patient.create! valid_attributes
      delete patient_url(patient)
      expect(response).to redirect_to(clinics_url)
    end
  end

end
