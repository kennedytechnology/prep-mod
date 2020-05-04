require 'rails_helper'

RSpec.describe Public::PatientsController, type: :controller do
  let(:clinic) { create(:clinic) }
  let(:patient) { create(:patient) }

  describe "GET #clear_session" do
    it "returns http success" do
      get :clear_session
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to root_path
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #edit" do
    context "success" do
      before do
        session[:patient_id] = patient.id
        put :edit, params: { step: "end_flag", clinic_id: clinic.id, patient: { 
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          middle_initial: ("A".."Z").to_a.sample,
          mothers_maiden_name: Faker::Name.last_name,
          age: (3..80).to_a.sample,
          email: "patient@example.com",
          date_of_birth: Faker::Date.birthday,
          address: "3440 Brookhaven Road",
          city: "Pasadena",
          state: "MD",
          zip_code: 21122,
          county: COUNTIES.sample,
          sex: %w(M F).sample,
          phone_number: Faker::PhoneNumber.cell_phone,
          appointment_time: clinic.appointment_times.sample, 
          student_id: Faker::IDNumber.unique,
          user_id: Faker::IDNumber.unique,
          email_confirmation: "patien@example.com",
          notify_via_sms: Faker::Boolean.boolean,
          notify_via_email: Faker::Boolean.boolean,
        } }
        patient.reload
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to "/client/registration" }
    end
  end
end
