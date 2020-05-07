require "rails_helper"

RSpec.describe Public::KitController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/kit/new").to route_to("public/kit#new")
    end

    it "routes to #create" do
      expect(post: "/kit/create").to route_to("public/kit#create")
    end
  end
end
