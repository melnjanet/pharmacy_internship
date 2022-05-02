require "rails_helper"

RSpec.describe GenericNamesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/generic_names").to route_to("generic_names#index")
    end

    it "routes to #new" do
      expect(get: "/generic_names/new").to route_to("generic_names#new")
    end

    it "routes to #show" do
      expect(get: "/generic_names/1").to route_to("generic_names#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/generic_names/1/edit").to route_to("generic_names#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/generic_names").to route_to("generic_names#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/generic_names/1").to route_to("generic_names#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/generic_names/1").to route_to("generic_names#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/generic_names/1").to route_to("generic_names#destroy", id: "1")
    end
  end
end
