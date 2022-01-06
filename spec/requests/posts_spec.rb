require 'rails_helper'

RSpec.describe PostsController, type: :feature do
  describe 'Testing posts index action, controller, routes and views' do
    before(:each) do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'user_email', with: '1@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'checks if page status was correct' do
      visit '/users/1/posts'
      expect(page).to have_http_status(:ok)
    end

    it 'checks if a correct template was rendered' do
      visit '/users/1/posts'
      expect(page).to have_selector('.users-container')
    end

    it 'checks if the page body includes correct placeholder text' do
      visit '/users/1/posts'
      expect(page).to have_content('Here is a list of posts all posts for the user')
    end
  end

  describe 'Testing posts show action, controller, routes and views' do
    before(:each) do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'user_email', with: '1@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'checks if page status was correct' do
      Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      visit '/users/1/posts/1'
      expect(page).to have_http_status(:ok)
    end

    it 'checks if a correct template was rendered' do
      Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      visit '/users/1/posts/1'
      expect(page).to have_content('Post #')
    end

    it 'checks if the page body includes correct placeholder text' do
      Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      visit '/users/1/posts/1'
      expect(page).to have_content('Here is the information for Post #1')
    end
  end
end
