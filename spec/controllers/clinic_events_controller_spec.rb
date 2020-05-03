require 'rails_helper'

RSpec.describe ClinicEventsController, type: :controller do
  let(:patient) { create(:patient) }
  let(:clinic_event) { create(:clinic_event) }
  let(:clinic_event_const) { CLINIC_EVENTS.sample }
  let(:user) { create(:user) }
  before { sign_in user }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: {clinic_id: clinic_event.clinic.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: {patient_id: clinic_event.patient.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new clinic event" do
        expect {
          post :create, params: { clinic_event: {
            clinic: clinic_event.clinic,
            patient: patient,
            category: clinic_event_const[:name],
            clinic_staff_id: clinic_event.clinic.clinic_personnel.sample,
            outcome: clinic_event_const[:outcomes].sample,
            created_at: Faker::Date.between(from: 30.days.ago, to:Date.today),
            user: user,
            notes: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 2, supplemental: true)
          } }
        }.to change(ClinicEvent, :count).by(1)
      end
    end
  end

  describe "POST #update" do
    context "success" do
      before do
        put :update, params: { id: clinic_event.id, clinic_event: { notes: "Test Note" } }
        clinic_event.reload
      end

      it { expect(response).to redirect_to root_path }
      it { expect(clinic_event.notes).to eq("Test Note") }
    end
  end

    it do
    params = {
      clinic_event: {
        clinic: clinic_event.clinic,
        patient: patient,
        category: clinic_event_const[:name],
        clinic_staff_id: clinic_event.clinic.clinic_personnel.sample,
        outcome: clinic_event_const[:outcomes].sample,
        created_at: Faker::Date.between(from: 30.days.ago, to:Date.today),
        user: user,
        notes: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 2, supplemental: true)
      }
    }
    should permit(:clinic_id, :patient_id, :category, :outcome,
      :notes, :contact_type, :screening_outcome,
      :test_name, :test_type, :test_processing, :clinic_staff_id).
      for(:create, params: params).
      on(:clinic_event)
  end

end