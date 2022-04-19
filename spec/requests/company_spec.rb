require 'rails_helper'

RSpec.describe "CompaniesControllers", type: :request do
    describe "GET /companies" do
        it "returns the index page" do
            get companies_path
            
            expect(response).to have_http_status(200)
        end
    end
end