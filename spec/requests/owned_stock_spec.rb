require 'rails_helper'

RSpec.describe "OwnedStocksControllers", type: :request do
    let!(:login) do
        user = User.create(first_name: "User", last_name: 'User', birthday: '01/01/2021',mobile: '09094556789', email: 'test@gmail.com', password: '123456')
        user.confirmed_at = Time.now
        sign_in user
    end
    describe "GET /owned_stocks" do
        it "returns the portfolio page" do
            get owned_stocks_path
            expect(response).to have_http_status(200)
        end
    end    
end