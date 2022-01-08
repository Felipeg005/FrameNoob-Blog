require 'rails_helper'

RSpec.describe PostsController, type: :feature do
  describe 'Testing User index view' do
    before(:each) do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'user_email', with: '1@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'checks if can see the username of all other users' do
      visit '/users/'
      expect(page).to have_selector('.users-container', count: 4)
    end

    it 'checks if can see the profile picture for each user' do
      visit '/users/'
      expect(page).to have_selector('.user-photo', count: 4)
    end

    it 'checks if can see the number of posts each user has written' do
      visit '/users/'
      expect(page).to have_content('Number of Posts', count: 4)
    end

    it 'checks if click on a user, I am redirected to that users show page' do
      visit '/users/'
      click_on 'Rudolph'
      expect(page).to have_current_path('/users/1')
    end
  end
end

