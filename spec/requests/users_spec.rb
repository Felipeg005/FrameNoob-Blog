require 'rails_helper'

RSpec.describe UsersController, type: :feature do
  describe 'Testing users index action, controller, routes and views' do
    before(:each) do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: '1@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'checks if page status was correct' do
      visit '/users'
      expect(page).to have_http_status(:ok)
    end
    it 'checks if a correct template was rendered' do
      visit '/users'
      expect(page).to have_selector('.users-container')
    end
    it 'checks if the page body includes correct placeholder text' do
      visit '/users'
      expect(page).to have_content('Here is a list of all users')
    end
  end

  describe 'Testing users show action, controller, routes and views' do
    before(:each) do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: '1@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'checks if page status was correct' do
      visit '/users/1'
      expect(page).to have_http_status(:ok)
    end
    it 'checks if a correct template was rendered' do
      visit '/users/1'
      expect(page).to have_selector('.users-container')
    end
    it 'checks if the page body includes correct placeholder text' do
      visit '/users/1'
      expect(page.body).to have_content('Here is all Rudolph history information')
    end
  end
end
