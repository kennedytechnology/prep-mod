require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  let(:clinic) { create(:clinic) }
  let(:user) { create(:user) }
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
      pending "create new clinic" do
        expect {
          post :create, params: { clinic: {
            provider_enrollment_id: provider_enrollment.id,
            venue_name: Faker::University.unique.name,
            clinic_date: Faker::Date.between(from: 1.month.ago, to: 6.months.from_now),
            lead_vaccinator_name: Faker::Name.unique.name,
            students_registered: Faker::Number.normal(mean: 100, standard_deviation: 50),
            clinic_status: %w(Pending Completed Cancelled).sample,
            outcome_comments: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true),
            incidents_comments: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true),
            start_time: "#{(9..12).to_a.sample}:00",
            end_time: "#{(13..17).to_a.sample}:00",
            duration: 180,
            age_groups: ClinicAgeGroup.all.sample(rand(ClinicAgeGroup.count) + 1),
            services: ClinicService.where(category: 'provider_enrollments').sample(rand(ClinicService.count) + 1),
            address: "8117 Mountain View Circle, Pasadena, MD 21122",
            longitude: -76.567383,
            latitude: 39.133262,
            location: "Nowhere",
            public_or_private: "Public",
            appointment_frequency_minutes: [10, 15, 30, 60].sample,
            appointment_slots: (2..10).to_a.sample,
            appointments_available: 'required',
            county: COUNTIES.sample,
            clinic_primary_groups: ClinicPrimaryGroup.all.sample,
            clinic_age_groups: ClinicAgeGroup.all.sample,
            clinic_services: ClinicService.all.sample,
          } }
        }.to change(Clinic, :count).by(1)
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

  it do
    params = {
      clinic: {
        venue_name: Faker::University.unique.name,
        clinic_date: Faker::Date.between(from: 1.month.ago, to: 6.months.from_now),
        lead_vaccinator_name: Faker::Name.unique.name,
        students_registered: Faker::Number.normal(mean: 100, standard_deviation: 50),
        clinic_status: %w(Pending Completed Cancelled).sample,
        outcome_comments: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true),
        incidents_comments: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true),
        start_time: "#{(9..12).to_a.sample}:00",
        end_time: "#{(13..17).to_a.sample}:00",
        duration: 180,
        age_groups: ClinicAgeGroup.all.sample(rand(ClinicAgeGroup.count) + 1),
        services: ClinicService.all.sample(rand(ClinicService.count) + 1),
        address: "8117 Mountain View Circle, Pasadena, MD 21122",
        longitude: -76.567383,
        latitude: 39.133262,
        appointment_frequency_minutes: [10, 15, 30, 60].sample,
        appointment_slots: (2..10).to_a.sample,
        appointments_available: 'required',
        county: COUNTIES.sample
      }
    }
    should permit(:clinic_status, :start_time, :end_time,
      :address, :lead_vaccinator_name,
      :clinic_date, :students_registered, :public_or_private,
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
        :contact_type, :screening_outcome, :clinic_staff_id, :notes, :test_name,
        :test_type, :test_processing, :category],
      test_kits_attributes: [:id, :test_name, :test_manufacturer,
        :test_lot_number, :test_type, :test_processing,
        :test_expiration_date, :test_kits_quantity, :tests_administered,
        :unusable_tests, :tests_returned, :_destroy]).
      for(:create, params: params).
      on(:clinic)
  end
end
