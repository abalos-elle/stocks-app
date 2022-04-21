require 'rails_helper'

RSpec.describe "Companies", type: :feature do
    describe "View all companies" do
        before {visit '/'}
        it 'shows the companies page' do
            within 'body'  do
                fill_in 'Email Address', with: 'jdlc@gmail.com'
                fill_in 'Password', with: '123456'
                click_button 'Login'
    
                expect(page).to have_content("Stock Trends")

                visit companies_path
                expect(page).to have_content("Companies")
            end
        end        
    end
end