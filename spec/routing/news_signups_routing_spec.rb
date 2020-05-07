require "rails_helper"

RSpec.describe NewsSignupsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/news_signups/new").to route_to("news_signups#new")
    end

    it "routes to #create" do
      expect(post: "/news_signups").to route_to("news_signups#create")
    end
  end
end
