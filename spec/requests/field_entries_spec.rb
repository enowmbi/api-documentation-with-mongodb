require 'rails_helper'

RSpec.describe "FieldEntries", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/field_entries/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/field_entries/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/field_entries/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
