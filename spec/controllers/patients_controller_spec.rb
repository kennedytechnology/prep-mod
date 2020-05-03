require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  let(:clinic) { create(:clinic) }
  let(:patient) { create(:patient) }
  let(:access_code) { Patient.generate_access_code }
  before { sign_in create(:user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new patient" do
        expect {
          post :create, params: { patient: {
            clinic_id: clinic.id,
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
            access_code: access_code,
            sex: %w(M F).sample,
            phone_number: Faker::PhoneNumber.cell_phone,
            appointment_time: clinic.appointment_times.sample, 
            student_id: Faker::IDNumber.unique,
            user_id: Faker::IDNumber.unique,
            email_confirmation: "patien@example.com",
            notify_via_sms: Faker::Boolean.boolean,
            notify_via_email: Faker::Boolean.boolean,
          } }
        }.to change(Patient, :count).by(1)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: patient.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: patient.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns https success" do
      delete :destroy, params: {id: patient.id}
      expect(response).to have_http_status(:redirect)
    end
  end

  #TODO: Find why the tests fail when this code is uncommented
  # it do
  #   params = {
  #     patient: {
  #       clinic_id: clinic.id,
  #       first_name: Faker::Name.first_name,
  #       last_name: Faker::Name.last_name,
  #       middle_initial: ("A".."Z").to_a.sample,
  #       mothers_maiden_name: Faker::Name.last_name,
  #       age: (3..80).to_a.sample,
  #       email: "patient@example.com",
  #       date_of_birth: Faker::Date.birthday,
  #       address: "3440 Brookhaven Road",
  #       city: "Pasadena",
  #       state: "MD",
  #       zip_code: 21122,
  #       county: COUNTIES.sample,
  #       access_code: access_code,
  #       sex: %w(M F).sample,
  #       phone_number: Faker::PhoneNumber.cell_phone,
  #       appointment_time: clinic.appointment_times.sample, 
  #       student_id: Faker::IDNumber.unique,
  #       user_id: Faker::IDNumber.unique,
  #       email_confirmation: "patien@example.com",
  #       notify_via_sms: Faker::Boolean.boolean,
  #       notify_via_email: Faker::Boolean.boolean,
  #     }
  #   }
  #   should permit(:clinic, :clinic_id, :user_id, :student_id, :access_code, :vaccination_status, :clinic_vaccine_id,
  #     :clinic_staff_id, :reaction_type, :downloaded_status, :state, :county, :city, :zip_code, :school,
  #     :first_name, :last_name, :mothers_maiden_name, :middle_initial, :age, :address, :email, :email_confirmation,
  #     :date_of_birth, :sex, :phone_number, :relation_to_patient_for_insurance, :insurance_type,
  #     :insured_first_name, :insured_last_name, :insured_name, :insured_date_of_birth, :type_of_insurance,
  #     :member_id_for_insurance, :card_number_for_insurance, :group_number_for_insurance,:insurance_company_name,
  #     :has_fever_over, :has_caugh, :has_difficult_breathing, :had_contact_with_confirmed_case, :is_age_60_or_more, :had_traveled_to_affected_place,
  #     :has_risk_factor, :has_other_reason, :other_reason_explanation, :consent_signature, :relation_to_patient_for_consent, :consent_date,
  #     :password, :password_confirmation, :notify_via_sms, :notify_via_email, :occupation).
  #     for(:create, params: params).
  #     on(:patient)
  # end
end
