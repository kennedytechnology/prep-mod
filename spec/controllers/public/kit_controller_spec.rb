require 'rails_helper'

RSpec.describe Public::KitController, type: :controller do
  let(:valid_attributes) { attributes_for(:patient) }
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new kit" do
        expect {
          post :create, params: { patient: valid_attributes}
        }.to change(Patient, :count).by(1)
        expect(response).to have_http_status(:redirect)
        expect(flash[:notice]).to eq("Your registration for a COVID-19 Safety Kit has been processed. Thank you.")
      end
    end
  end

  it do
    should permit(:county, :first_name, :middle_initial, :last_name, :address,
        :state, :city, :zip_code, :number_of_adults,
        :number_of_children, :email, :phone_number,
        :relation_to_patient_for_insurance, :consent_date,
        :occupation, :date_of_birth, :race).
      for(:create, params: {patient: valid_attributes}).
      on(:patient)
  end
end
