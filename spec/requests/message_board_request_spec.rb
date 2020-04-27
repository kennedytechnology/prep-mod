require 'rails_helper'

RSpec.describe "MessageBoards", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/message_board/index"
      expect(response).to have_http_status(:success)
    end
  end

end
