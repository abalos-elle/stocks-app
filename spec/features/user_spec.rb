require 'rails_helper'

RSpec.describe User, type: :feature do
    describe "Account Sign up" do
        before {visit '/'}

        it 'shows error message when registering an account with same email' do
            within 'body' do
                expect(page).to have_content("Sign up")
                click_link 'Sign up'

                expect(page).to have_content("Sign up for an account.")
                expect(page).to have_content("First Name")
                expect(page).to have_content("Last Name")
                expect(page).to have_content("Birthday")

                fill_in 'First Name', with: 'Juan'
                fill_in 'Last Name', with: 'Dela Cruz'
                fill_in 'Birthday', with: '01/01/2001'
                fill_in 'Mobile No.', with: '09092217563'
                fill_in 'Email Address', with: 'jdlc@gmail.com'
                fill_in 'Password', with: '123456'
                fill_in 'Password confirmation', with: '123456'
                click_button 'Sign Up'

                expect(page).to have_content('Email has already been taken') #Seed this particular account
            end
        end 
    #     it 'redirects to the login page after successful registration' do
    #         within 'body' do
    #             expect(page).to have_content("Sign up")
    #             click_link 'Sign up'

    #             expect(page).to have_content("Sign up for an account.")
    #             expect(page).to have_content("First Name")
    #             expect(page).to have_content("Last Name")
    #             expect(page).to have_content("Birthday")

    #             fill_in 'First Name', with: 'Mark'
    #             fill_in 'Last Name', with: 'Dela Cruz'
    #             fill_in 'Birthday', with: '01/01/2001'
    #             fill_in 'Mobile No.', with: '0909224463'
    #             fill_in 'Email Address', with: 'mdlc@gmail.com'
    #             fill_in 'Password', with: '123456'
    #             fill_in 'Password confirmation', with: '123456'
    #             click_button 'Sign Up'

    #             expect(page).to have_content('Sign in to your account.')                
    #         end
    #     end    
    end

    describe 'Login' do
        scenario 'shows the home page when logged in with correct credentials' do
            visit '/'
            within 'body'  do
                fill_in 'Email Address', with: 'jdlc@gmail.com'
                fill_in 'Password', with: '123456'
                click_button 'Login'

                expect(page).to have_content("Stock Trends")
            end
        end
    end
end