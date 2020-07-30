require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  let(:user) { create(:user) }
  let(:clinic) { create(:clinic) }
  let(:valid_attributes) { attributes_for(:clinic) }
  before { sign_in user }

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
      let(:provider_enrollment) { create(:provider_enrollment) }
      it "create new clinic" do
        expect {
          post :create, params: { clinic: valid_attributes, clinic_dates: [
            Faker::Date.between(from: Date.today, to: 6.months.from_now),
            Faker::Date.between(from: Date.today, to: 6.months.from_now)
          ] }
        }.to change(Clinic, :count).by(2)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: clinic.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #update" do
    context "success" do
      before do
        put :update, params: { id: clinic.id, clinic: { clinic_date: Date.today } }
        clinic.reload
      end

      it { expect(response).to redirect_to clinics_path(clinic_date: 'upcoming') }
      it { expect(clinic.clinic_date).to eq(Date.today) }
    end
  end

  describe "POST #update" do
    context "success" do
      before do
        put :update, params: { id: clinic.id, "save-submit": "Save and Submit", clinic: {
          clinic_date: Date.today
        } }
        clinic.reload
      end

      it { expect(response).to redirect_to clinics_path(clinic_date: 'upcoming') }
    end
  end

  describe "GET #acitivity" do
    it "returns http success" do
      get :activity, params: { clinic_id: clinic.id }
      expect(response).to have_http_status(:success)
    end
  end

  pending do
    should permit(:clinic_status, :start_time, :end_time,
      :address, :lead_vaccinator_name,
      :clinic_date, :public_or_private,
      :incidents_comments, :county, :venue_name, :zip,
      :city, :state, :appointment_frequency_minutes,
      :appointment_slots, :contact_person, :contact_phone_number,
      :backup_contact_person, :backup_contact_phone_number,
      :start_hour_minute, :start_meridiem,
      :end_hour_minute, :end_meridiem, :start_hour, :start_minute, :end_hour, :end_minute,
      :appointments_available, users: [], :service_ids => [],
      :age_group_ids => [], :primary_group_ids => [],
      clinic_personnel_attributes: [:id, :name, :_destroy],
      clinic_events_attributes: [:id, :patient_id, :outcome, :safety_kit_received,
        :contact_type, :clinic_staff_id, :notes, :test_name,
        :test_type, :test_processing, :category],
      test_kits_attributes: [:id, :test_name, :test_manufacturer,
        :test_lot_number, :test_type, :test_processing,
        :test_expiration_date, :test_kits_quantity, :tests_administered,
        :unusable_tests, :tests_returned, :_destroy]).
      for(:create, params: {clinic: valid_attributes}).
      on(:clinic)
  end
end
