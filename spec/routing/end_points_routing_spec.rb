require "rails_helper"

RSpec.describe EndPointsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/end_points").to route_to("end_points#index")
    end

    it "routes to #new" do
      expect(get: "/end_points/new").to route_to("end_points#new")
    end

    it "routes to #show" do
      expect(get: "/end_points/1").to route_to("end_points#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/end_points/1/edit").to route_to("end_points#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/end_points").to route_to("end_points#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/end_points/1").to route_to("end_points#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/end_points/1").to route_to("end_points#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/end_points/1").to route_to("end_points#destroy", id: "1")
    end
  end
end
