require 'rails_helper'

RSpec.describe EmployersController, type: :controller do
  let(:employer) { create(:employer) }
  let(:valid_attributes) { attributes_for(:employer) }
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
      it "create new employer" do
        expect {
          post :create, params: { employer: valid_attributes }
        }.to change(Employer, :count).by(1)
      end
    end
  end

  it do
    should permit(:screening_info, :testing_info, :vacination_info, :other_info,
        :business_locations, :first_name, :last_name, :position, :company_name,
        :address_1, :address_2, :city, :zip_code, :state, :office_phone, :mobile_phone,
        :email, :website, :backup_first_name, :backup_last_name, :backup_position,
        :backup_company_name, :backup_address_1, :backup_address_2, :backup_city,
        :backup_zip_code, :backup_state, :total_employees, :total_locations, :comment,
        :backup_email, business_locations: []).
      for(:create, params: {employer: valid_attributes}).
      on(:employer)
  end
end
