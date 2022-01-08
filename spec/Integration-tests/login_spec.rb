require 'rails_helper'

RSpec.describe PostsController, type: :feature do
  describe 'Testing Login index action, controller, routes and view' do
    it 'checks if page status was correct' do
      visit '/users/sign_in'
      expect(page).to have_http_status(:ok)
    end

    it 'checks if page renders username and password inputs and the "Submit" button' do
      visit '/users/sign_in'
      expect(page).to have_selector('#user_email')
      expect(page).to have_selector('#user_password')
      expect(page).to have_selector('.actions')
      expect(page).to have_content('Log in')
    end

    it 'checks if click the submit button without filling in the username and the password, I get a detailed error' do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'checks if click the submit button after filling in the username and the password with incorrect data, I get a detailed error' do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: 'Ruperth'
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'checks if click the submit button after filling in the username and the password with correct data, I am redirected to the root page' do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: '1@gmail.com'
        fill_in 'user_password', with: '1234567'
      end

      click_button 'Log in'
      expect(page).to have_current_path('/')
    end
  end
end
