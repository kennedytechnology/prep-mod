require 'rails_helper'

RSpec.describe Public::NewsSignupsController, type: :controller do
  let(:valid_attributes) { attributes_for(:news_signup) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new signup" do
        expect {
          post :create, params: {news_signup: valid_attributes}
        }.to change(NewsSignup, :count).by(1)
      end
    end
  end

  it do
    should permit(:first_name, :last_name, :email, :date_of_birth, :zip_code, :occupation, topics: []).
      for(:create, params: {news_signup: valid_attributes}).
      on(:news_signup)
  end
end
