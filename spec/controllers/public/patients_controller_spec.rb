require 'rails_helper'

RSpec.describe Public::PatientsController, type: :controller do
  let(:clinic) { create(:clinic) }
  let(:patient) { create(:patient) }
  let(:valid_attributes) { attributes_for(:patient) }

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
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "PUT #edit" do
    context "success" do
      before do
        session[:patient_id] = patient.id
        put :edit, params: { step: "end_flag", clinic_id: clinic.id, patient: valid_attributes}
        patient.reload
      end
      
      it { expect(response).to have_http_status(:success) }
      
    end
  end
end
