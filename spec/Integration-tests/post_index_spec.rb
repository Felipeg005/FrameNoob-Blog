require 'rails_helper'

RSpec.describe PostsController, type: :feature do
  describe 'Testing Post index view' do
    before(:each) do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: '1@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'checks if can see the user profile picture' do
      visit '/users/1/posts/'
      expect(page).to have_selector('.user-photo', count: 1)
    end

    it 'checks if can see the users username' do
      visit '/users/1/posts/'
      expect(page).to have_content('Rudolph')
    end

    it 'checks if can see the number of posts the user has written' do
      visit '/users/1/posts/'
      expect(page).to have_content('Number of Posts:')
    end

    it 'checks if can see the posts title' do
      5.times do
        Post.create(author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      end
      visit '/users/1/posts/'
      expect(page).to have_selector('.posts-title-container', count: 5)
    end

    it 'checks if can see some of the posts body' do
      5.times do
        Post.create(author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      end
      visit '/users/1/posts/'
      expect(page).to have_content('Great framework', count: 5)
    end

    it 'checks if can see the first comments on a post' do
      Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      Comment.create(author_id: '1', post_id: '1', text: 'I like this')
      visit '/users/1/posts/'
      expect(page).to have_content('I like this')
    end

    it 'checks if see how many comments a post has' do
      Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      Comment.create(author_id: '1', post_id: '1', text: 'I like this')
      visit '/users/1/posts/'
      expect(page).to have_content('comments:')
    end

    it 'checks if see how many likes a post has' do
      Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      Comment.create(author_id: '1', post_id: '1', text: 'I like this')
      visit '/users/1/posts/'
      expect(page).to have_content('likes:')
    end

    it 'checks if click on a post, it redirects me to that posts show page' do
      5.times do
        Post.create(author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      end
      visit '/users/1/posts'
      post = User.recent_posts(1).to_a
      click_on(class: "link#{post[0].id}")
      expect(page).to have_current_path("/users/1/posts/#{post[0].id}")
    end
  end
end
