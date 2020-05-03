require 'rails_helper'

RSpec.describe ClinicEventsController, type: :controller do
  let(:clinic_event) { create(:clinic_event) }
  before { sign_in create(:user) }

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
end
