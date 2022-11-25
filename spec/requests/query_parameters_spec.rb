require 'rails_helper'

RSpec.describe "QueryParameters", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/query_parameters/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/query_parameters/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/query_parameters/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
