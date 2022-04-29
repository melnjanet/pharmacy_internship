require "rails_helper"

RSpec.describe AtcCodesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/atc_codes").to route_to("atc_codes#index")
    end

    it "routes to #new" do
      expect(get: "/atc_codes/new").to route_to("atc_codes#new")
    end

    it "routes to #show" do
      expect(get: "/atc_codes/1").to route_to("atc_codes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/atc_codes/1/edit").to route_to("atc_codes#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/atc_codes").to route_to("atc_codes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/atc_codes/1").to route_to("atc_codes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/atc_codes/1").to route_to("atc_codes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/atc_codes/1").to route_to("atc_codes#destroy", id: "1")
    end
  end
end
