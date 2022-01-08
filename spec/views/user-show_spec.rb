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

    it 'checks if can see the user profile picture' do
      visit '/users/1/'
      expect(page).to have_selector('.user-photo', count: 1)
    end

    it 'checks if can see the users username' do
      visit '/users/1/'
      expect(page).to have_content('Rudolph')
    end

    it 'checks if can see the number of posts the user has written' do
      visit '/users/1/'
      expect(page).to have_content('Number of Posts:')
    end

    it 'checks if can see the user bio' do
      visit '/users/1/'
      expect(page).to have_content('I love dancing')
      visit '/users/2/'
      expect(page).to have_content('I love hiking')
      visit '/users/3/'
      expect(page).to have_content("My favorite movie its Pan's Labyrinth")
      visit '/users/4/'
      expect(page).to have_content("Life is wonderful, I'm here to learn")
    end

    it 'checks if can see the user first 3 posts' do
      5.times do
        Post.create(author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      end
      visit '/users/1/'
      expect(page).to have_selector('.posts-container', count: 3)
    end

    it 'checks if can see a button that lets me view all of a users posts' do
      visit '/users/1/'
      expect(page).to have_content('See all Posts')
    end

    it 'checks if click a user post, it redirects me to that post show page' do
      5.times do
        Post.create(author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      end
      visit '/users/1/'
      post = User.recent_posts(1).to_a
      click_on(class: "link#{post[0].id}")
      expect(page).to have_current_path("/users/1/posts/#{post[0].id}")
    end

    it 'checks if click to see all posts, it redirects me to the user posts index page' do
      visit '/users/2/'
      click_on 'See all Posts'
      expect(page).to have_current_path('/users/2/posts')
    end
  end
end

