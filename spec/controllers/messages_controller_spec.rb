require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:message) { create(:message) }
  let(:valid_attributes) { attributes_for(:message) }
  before { sign_in create(:user) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new message" do
        expect {
          post :create, params: { message: valid_attributes }
        }.to change(Message, :count).by(1)
      end
    end
  end

  it do
    should permit(
      :subject, :body, :send_to_all_users
    ).for(:create, params: {message: valid_attributes})
    .on(:message)
  end
end
