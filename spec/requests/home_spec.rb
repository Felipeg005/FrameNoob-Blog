require 'rails_helper'

RSpec.describe 'Homes', type: :feature do

  describe 'GET /index' do
    it 'returns http success' do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'user_email', with: '1@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Log in'
      expect(page).to have_content 'Welcome'
    end
  end
end
