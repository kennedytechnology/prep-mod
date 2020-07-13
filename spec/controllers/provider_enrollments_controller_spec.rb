require 'rails_helper'

RSpec.describe ProviderEnrollmentsController, type: :controller do
  let(:provider_enrollment) { create(:provider_enrollment) }
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
      #TODO: create working spec for post
      pending "create new provider enrollment" do
        expect {
          post :create, params: { provider_enrollment: {
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.first_name,
            middle_initial: Faker::Name.middle_name,
            professional_license: PROFESSIONAL_LICENSES.sample,
            title: "Title 1",
            contact_office_phone: Faker::PhoneNumber.cell_phone,
            contact_mobile_phone: Faker::PhoneNumber.cell_phone,
            contact_email: Faker::Internet.email,
            county: COUNTIES.sample,
            license_state_of_issue: US_STATES.sample,
            license_date_of_issue: Faker::Date.between(from: 30.days.from_now, to: 365.days.from_now),
            practice_office_phone: Faker::PhoneNumber.cell_phone,
            practice_fax_number: "fax 1",
            practice_mobile_phone: Faker::PhoneNumber.cell_phone,
            practice_email: Faker::Internet.email,
            practice_type: PRACTICE_TYPES.sample,
            practice_name: "Practice Name 1",
            practice_address: Faker::Address.full_address,
            practice_city: Faker::Address.city,
            practice_state: US_STATES.sample,
            practice_zip_code: Faker::Address.zip_code,
            practice_backup_contact: Faker::Name.name,
            practice_backup_office_phone: Faker::PhoneNumber.cell_phone,
            practice_backup_email: Faker::Internet.email,
            practice_backup_mobile_phone: Faker::PhoneNumber.cell_phone,
            does_provide_vaccination:Faker::Boolean.boolean,
            does_provide_vfc: Faker::Boolean.boolean,
            refrigerator: Faker::Boolean.boolean,
            freezer: Faker::Boolean.boolean,
            refrigerator_thermometer: Faker::Boolean.boolean,
            additional_info: Faker::Lorem.paragraph,
            npi_number: "npi number 1",
            license_number: "license number 1",
            license_type: "license type 1",
            medical_specialty: MEDICAL_SPECIALTY.sample
          } }
        }.to change(ProviderEnrollment, :count).by(1)
      end
    end
  end

  describe "POST #update" do
    context "success" do
      before do
        put :update, params: { id: provider_enrollment.id, reviewed: true, status: "pending", provider_enrollment: { license_number: "New License Number 2" } }
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
    params = {
      provider_enrollment: {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.first_name,
        middle_initial: Faker::Name.middle_name,
        professional_license: PROFESSIONAL_LICENSES.sample,
        title: "Title 1",
        contact_office_phone: Faker::PhoneNumber.cell_phone,
        contact_mobile_phone: Faker::PhoneNumber.cell_phone,
        contact_email: Faker::Internet.email,
        county: COUNTIES.sample,
        license_state_of_issue: US_STATES.sample,
        license_date_of_issue: Faker::Date.between(from: 30.days.from_now, to: 365.days.from_now),
        practice_office_phone: Faker::PhoneNumber.cell_phone,
        practice_fax_number: "fax 1",
        practice_mobile_phone: Faker::PhoneNumber.cell_phone,
        practice_email: Faker::Internet.email,
        practice_type: PRACTICE_TYPES.sample,
        practice_name: "Practice Name 1",
        practice_address: Faker::Address.full_address,
        practice_city: Faker::Address.city,
        practice_state: US_STATES.sample,
        practice_zip_code: Faker::Address.zip_code,
        practice_backup_contact: Faker::Name.name,
        practice_backup_office_phone: Faker::PhoneNumber.cell_phone,
        practice_backup_email: Faker::Internet.email,
        practice_backup_mobile_phone: Faker::PhoneNumber.cell_phone,
        does_provide_vaccination:Faker::Boolean.boolean,
        does_provide_vfc: Faker::Boolean.boolean,
        refrigerator: Faker::Boolean.boolean,
        freezer: Faker::Boolean.boolean,
        refrigerator_thermometer: Faker::Boolean.boolean,
        additional_info: Faker::Lorem.paragraph,
        npi_number: "npi number 1",
        license_number: "license number 1",
        license_type: "license type 1",
        medical_specialty: MEDICAL_SPECIALTY.sample
      }
    }
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
