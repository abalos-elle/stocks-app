require 'rails_helper'

RSpec.describe "Companies", type: :feature do
    describe "View all companies" do
        before {visit companies_path}

        it 'shows all companies in the body' do
            within 'body' do
                expect(page).to have_content("Companies")
                expect(page).to have_content("Companies")
            end
        end    
    end
end