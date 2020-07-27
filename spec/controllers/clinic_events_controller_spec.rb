require 'rails_helper'

RSpec.describe ClinicEventsController, type: :controller do
  let(:user) { create(:user, email: "user@clinic_event.com", email_confirmation: "user@clinic_event.com") }
  let(:patient) { create(:patient, user: user) }
  let(:clinic_event) { create(:clinic_event, user: user) }
  let(:valid_attributes) { attributes_for(:clinic_event).merge({patient_id: patient.id}) }
  let(:clinic_event_const) { CLINIC_EVENTS.sample }
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
          post :create, params: { clinic_event: valid_attributes }
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
    should permit(:clinic_id, :patient_id, :category, :outcome, :notes, :contact_type,
      :test_name, :test_type, :test_processing, :clinic_staff_id).
      for(:create, params: {clinic_event: valid_attributes}).
      on(:clinic_event)
  end

end