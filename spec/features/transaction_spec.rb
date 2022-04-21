require 'rails_helper'

RSpec.describe "Transactions", type: :feature do
    describe "View all transactions" do
        before {visit '/'}
        it 'shows the transactions page' do
            within 'body'  do
                fill_in 'Email Address', with: 'jdlc@gmail.com'
                fill_in 'Password', with: '123456'
                click_button 'Login'
    
                visit transactions_path
                expect(page).to have_content("Transactions")
            end
        end
        it 'shows the new transactions modal' do
            within 'body'  do
                fill_in 'Email Address', with: 'jdlc@gmail.com'
                fill_in 'Password', with: '123456'
                click_button 'Login'
                # page.find('#btn_buy_31').click                
            end
        end        
    end
end