require 'rails_helper'

RSpec.describe ProviderEnrollmentsController, type: :controller do
  let(:valid_attributes) { attributes_for(:provider_enrollment).merge({
    clinic_service_ids: [create(:clinic_service).id],
    clinic_age_group_ids: [create(:clinic_age_group).id],
    clinic_primary_group_ids: [create(:clinic_primary_group).id]
    }) 
  }
  let(:provider_enrollment) { create(:provider_enrollment) }
  let(:provider_enrollment_build) { build(:provider_enrollment)}

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
      it "creates new provider enrollment" do
        expect {
          post :create, params: { provider_enrollment: valid_attributes }
        }.to change(ProviderEnrollment, :count).by(1)
      end
    end
  end

  describe "POST #update" do
    context "success" do
      before do
        put :update, params: { id: provider_enrollment.id, provider_enrollment: { license_number: "New License Number 2" } }
        provider_enrollment.reload
      end

      it { expect(response).to redirect_to provider_enrollments_path }
      it { expect(flash[:notice]).to match("Successfully update provider enrollment!") }
      it { expect(provider_enrollment.license_number).to eq("New License Number 2") }
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: provider_enrollment.id }
      expect(response).to have_http_status(:success)
    end
  end

  it do
    params = { provider_enrollment: valid_attributes }
    should permit(:first_name, :last_name, :middle_initial, :status, 
        :practice_address, :practice_office_phone, :practice_mobile_phone, 
        :practice_fax_number, :practice_email, :title, 
        :npi_number, :license_number, :license_type, 
        :medical_specialty, :professional_license, :license_date_of_issue, 
        :license_state_of_issue, :practice_type, :practice_name, 
        :practice_city, :practice_state, :practice_zip_code, 
        :practice_backup_contact, :practice_backup_phone, :practice_backup_email, 
        :does_provide_vaccination, :does_provide_vfc, :refrigerator, 
        :refrigerator_thermometer, :contact_office_phone, :contact_mobile_phone, 
        :contact_email, :practice_backup_office_phone, :practice_backup_mobile_phone,
        :additional_info, :freezer, :county, :clinic_service_ids => [], 
        :clinic_age_group_ids => [], :clinic_primary_group_ids => []).
      for(:create, params: params).
      on(:provider_enrollment)
  end
end
