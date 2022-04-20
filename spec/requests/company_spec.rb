require 'rails_helper'

RSpec.describe "CompaniesControllers", type: :request do
    let!(:login) do
        user = User.create(first_name: "User", last_name: 'User', birthday: '01/01/2021',mobile: '09094556789', email: 'test@gmail.com', password: '123456')
        user.confirmed_at = Time.now
        sign_in user
    end
    describe "GET /companies" do
        it "returns the companies page" do
            get companies_path
            expect(response).to have_http_status(200)
        end
    end     
    # describe "GET /companies/:id" do
    #     it "returns the selected company page" do
            
    #         get company_url, :id => 31
    #         expect(response).to have_http_status(200)
    #     end
    # end     
end