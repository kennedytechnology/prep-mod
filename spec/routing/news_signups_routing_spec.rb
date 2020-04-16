require "rails_helper"

RSpec.describe NewsSignupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/news_signups").to route_to("news_signups#index")
    end

    it "routes to #new" do
      expect(get: "/news_signups/new").to route_to("news_signups#new")
    end

    it "routes to #show" do
      expect(get: "/news_signups/1").to route_to("news_signups#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/news_signups/1/edit").to route_to("news_signups#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/news_signups").to route_to("news_signups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/news_signups/1").to route_to("news_signups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/news_signups/1").to route_to("news_signups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/news_signups/1").to route_to("news_signups#destroy", id: "1")
    end
  end
end
