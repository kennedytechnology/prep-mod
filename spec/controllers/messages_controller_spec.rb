require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:message) { create(:message) }
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
          post :create, params: { message: {
            subject: "Some cool subject",
            body: "Some cool body",
            send_to_all_users: Faker::Boolean.boolean
          } }
        }.to change(Message, :count).by(1)

        # expect(response)
      end
    end
  end

  it do
    params = {
      message: {
        subject: "Some cool subject",
        body: "Some cool body",
        send_to_all_users: Faker::Boolean.boolean
      }
    }
    should permit(:subject, :body, :send_to_all_users).for(:create, params: params).on(:message)
  end
end
