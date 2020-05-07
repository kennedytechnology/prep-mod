require "rails_helper"

RSpec.describe CustomizedReportsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/customized_reports").to route_to("customized_reports#index")
    end

    it "routes to #new" do
      expect(get: "/customized_reports/new").to route_to("customized_reports#new")
    end

    it "routes to #show" do
      expect(get: "/customized_reports/1").to route_to("customized_reports#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/customized_reports/1/edit").to route_to("customized_reports#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/customized_reports").to route_to("customized_reports#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/customized_reports/1").to route_to("customized_reports#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/customized_reports/1").to route_to("customized_reports#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/customized_reports/1").to route_to("customized_reports#destroy", id: "1")
    end
  end
end
