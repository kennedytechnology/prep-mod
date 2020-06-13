require 'rails_helper'

RSpec.describe EmployersController, type: :controller do
  let(:employer) { create(:employer) }
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
          post :create, params: { employer: {
            screening_info: Faker::Boolean.boolean,
            testing_info: Faker::Boolean.boolean,
            vacination_info: Faker::Boolean.boolean,
            other_info: Faker::Boolean.boolean,
            business_locations: BUSINESS_LOCATIONS.sample(rand(4)),
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.first_name,
            position: "position 5",
            company_name: Faker::Company.name,
            address_1: Faker::Address.full_address,
            address_2: Faker::Address.full_address,
            city: Faker::Address.city,
            zip_code: Faker::Address.zip_code,
            state: Faker::Address.state,
            office_phone: Faker::PhoneNumber.cell_phone,
            mobile_phone: Faker::PhoneNumber.cell_phone,
            email: Faker::Internet.email,
            website: Faker::Internet.url,
            backup_first_name: Faker::Name.first_name,
            backup_last_name: Faker::Name.first_name,
            backup_position: "backup position 5",
            backup_company_name: Faker::Company.name,
            backup_address_1: Faker::Address.full_address,
            backup_address_2: Faker::Address.full_address,
            backup_city: Faker::Address.city,
            backup_zip_code: Faker::Address.zip_code,
            backup_state: Faker::Address.state,
            backup_office_phone: Faker::PhoneNumber.cell_phone,
            backup_mobile_phone: Faker::PhoneNumber.cell_phone,
            backup_email: Faker::Internet.email,
            total_employees: Faker::Number.between(from: 5, to: 50),
            total_locations: Faker::Number.between(from: 5, to: 10) } }
        }.to change(Employer, :count).by(1)
      end
    end
  end

  it do
    params = {
      employer: {
        screening_info: Faker::Boolean.boolean,
        testing_info: Faker::Boolean.boolean,
        vacination_info: Faker::Boolean.boolean,
        other_info: Faker::Boolean.boolean,
        business_locations: BUSINESS_LOCATIONS.sample(rand(4)),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.first_name,
        position: "position 5",
        company_name: Faker::Company.name,
        address_1: Faker::Address.full_address,
        address_2: Faker::Address.full_address,
        city: Faker::Address.city,
        zip_code: Faker::Address.zip_code,
        state: Faker::Address.state,
        office_phone: Faker::PhoneNumber.cell_phone,
        mobile_phone: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
        website: Faker::Internet.url,
        backup_first_name: Faker::Name.first_name,
        backup_last_name: Faker::Name.first_name,
        backup_position: "backup position 5",
        backup_company_name: Faker::Company.name,
        backup_address_1: Faker::Address.full_address,
        backup_address_2: Faker::Address.full_address,
        backup_city: Faker::Address.city,
        backup_zip_code: Faker::Address.zip_code,
        backup_state: Faker::Address.state,
        backup_office_phone: Faker::PhoneNumber.cell_phone,
        backup_mobile_phone: Faker::PhoneNumber.cell_phone,
        backup_email: Faker::Internet.email,
        total_employees: Faker::Number.between(from: 5, to: 50),
        total_locations: Faker::Number.between(from: 5, to: 10)
      }
    }
    should permit(:screening_info, :testing_info, :vacination_info, :other_info,
        :business_locations, :first_name, :last_name, :position, :company_name,
        :address_1, :address_2, :city, :zip_code, :state, :office_phone, :mobile_phone,
        :email, :website, :backup_first_name, :backup_last_name, :backup_position,
        :backup_company_name, :backup_address_1, :backup_address_2, :backup_city,
        :backup_zip_code, :backup_state, :total_employees, :total_locations, :comment,
        :backup_email, business_locations: []).
      for(:create, params: params).
      on(:employer)
  end
end
