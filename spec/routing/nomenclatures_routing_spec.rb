require "rails_helper"

RSpec.describe NomenclaturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/nomenclatures").to route_to("nomenclatures#index")
    end

    it "routes to #new" do
      expect(get: "/nomenclatures/new").to route_to("nomenclatures#new")
    end

    it "routes to #show" do
      expect(get: "/nomenclatures/1").to route_to("nomenclatures#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/nomenclatures/1/edit").to route_to("nomenclatures#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/nomenclatures").to route_to("nomenclatures#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/nomenclatures/1").to route_to("nomenclatures#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/nomenclatures/1").to route_to("nomenclatures#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/nomenclatures/1").to route_to("nomenclatures#destroy", id: "1")
    end
  end
end
