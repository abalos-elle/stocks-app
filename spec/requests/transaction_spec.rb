require 'rails_helper'

RSpec.describe "TransactionsControllers", type: :request do
    let!(:login) do
        user = User.create(first_name: "User", last_name: 'User', birthday: '01/01/2021',mobile: '09094556789', email: 'test@gmail.com', password: '123456')
        user.confirmed_at = Time.now
        sign_in user
    end    
    describe "GET /transactions" do
        it "returns the transactions page" do
            get transactions_path
            expect(response).to have_http_status(200)
        end
    end
    describe "GET /new type: 1" do
        it "returns the new (buy) transaction modal" do
            headers = { "ACCEPT" => "application/javascript" }
            
            testdata = {:type => 1, :company_id => 31}
            get new_transaction_path, :params => testdata, :headers => headers
            expect(response).to have_http_status(200)
        end
    end
    describe "GET /new type: 2" do
        it "returns the new (sell) transaction modal" do
            headers = { "ACCEPT" => "application/javascript" }
            testdata = {:type => 2, :stock => 1}
            get new_transaction_path, :params => testdata, :headers => headers
            expect(response).to have_http_status(200)
        end
    end
end