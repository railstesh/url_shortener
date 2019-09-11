# spec/controllers/api/v1/shorten_urls_controller_spec.rb

require 'rails_helper'
RSpec.describe Api::V1::ShortenUrlsController do
  describe "POST #create" do
    it "JSON body response contains expected shorten_url attributes" do
      post :create, params: { url: 'https://stackoverflow.com/questions/16072284/how-to-request-get-post-routes-in-rspec-that-have-a-wildcard' }
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["status", "shorten_url", "existing_value"])
    end

    it "JSON body response contains exitsing shorten_url attributes" do
      post :create, params: { url: 'https://stackoverflow.com/questions/16072284/how-to-request-get-post-routes-in-rspec-that-have-a-wildcard' }
      post :create, params: { url: 'https://stackoverflow.com/questions/16072284/how-to-request-get-post-routes-in-rspec-that-have-a-wildcard' }
      json_response = JSON.parse(response.body)
      expect(json_response["existing_value"]).to eq_to(true)
    end

    it "JSON body response contain wrong url attributes" do
      post :create, params: { url: '//stackoverflow.com/questions/16072284/how-to-request-get-post-routes-in-rspec-that-have-a-wildcard' }
      json_response = JSON.parse(response.body)
      expect(json_response["error"]).to eq_to("Please enter valid Url!")
    end
  end
  describe "POST #top_most_url" do
    it "JSON body response contain collection of URLs" do
      post :top_most_url
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["shorten_urls"])
    end
  end
end