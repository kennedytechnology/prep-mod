require 'rails_helper'

RSpec.describe "Patients", type: :request do

  describe "GET /index" do
    pending "returns http success" do
      get "/patients/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    pending "returns http success" do
      get "/patients/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    pending "returns http success" do
      get "/patients/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    pending "returns http success" do
      get "/patients/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
