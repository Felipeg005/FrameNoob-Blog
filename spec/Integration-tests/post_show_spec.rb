require 'rails_helper'

RSpec.describe PostsController, type: :feature do
  describe 'Testing Post show view' do
    before(:each) do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: '1@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Log in'
      Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
    end

    it 'checks if can see the posts title' do
      visit '/users/1/posts/1'
      expect(page).to have_content('I like rails')
    end

    it 'checks if can see who wrote the post' do
      visit '/users/1/posts/1'
      expect(page).to have_content('Author: Rudolph')
    end

    it 'checks if can see how many comments it has' do
      visit '/users/1/posts/1'
      expect(page).to have_content('comments:')
    end

    it 'checks if see how many likes a post has' do
      visit '/users/1/posts/1'
      expect(page).to have_content('likes:')
    end

    it 'checks if can see the posts body' do
      visit '/users/1/posts/1'
      expect(page).to have_content('Great framework')
    end

    it 'checks if can see the username of each commentor' do
      Comment.create(id: 1, author_id: '1', post_id: '1', text: 'I like this')
      visit '/users/1/posts/1'
      expect(page).to have_content('Rudolph: I like this // comment #1')
    end

    it 'checks if can see the comment each commentor left' do
      Comment.create(id: 1, author_id: '1', post_id: '1', text: 'I like this')
      visit '/users/1/posts/1'
      expect(page).to have_content('I like this')
    end
  end
end
