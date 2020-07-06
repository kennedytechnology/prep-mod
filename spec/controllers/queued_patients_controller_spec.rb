require 'rails_helper'

RSpec.describe QueuedPatientsController, type: :controller do
  let(:clinic) { create(:clinic) }
  before  do
    sign_in create(:user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, params: {clinic_id: clinic.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #send_check_in_reminders" do
    it "returns http success" do
      get :send_check_in_reminders, params: {clinic_id: clinic.id}
      expect(response).to redirect_to(clinic_queued_patients_path(clinic.id))
    end
  end
end
