# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(id: 1, name: "Rudolph", photo: "link#", bio: "I love dancing", posts_counter: 2)
user2 = User.create(id: 2, name: "Stella", photo: "link#", bio: "I love hiking", posts_counter: 1)
user3 = User.create(id: 3, name: "Bill", photo: "link#", bio: "My favorite movie its Pan's Labyrinth", posts_counter: 2)
user4 = User.create(id: 4, name: "Elisa", photo: "link#", bio: "Life is wonderful, I'm here to learn", posts_counter: 1)
p "Created #{User.count} Users"

post1 = Post.create!(id: 1, author_id: user1.id, title: "my first post", text: "dancing its great", comments_counter: 2, likes_counter: 2)
post2 = Post.create!(id: 2, author_id: user1.id, title: "my second post", text: "dancing its the best for me", comments_counter: 3, likes_counter: 5)
post3 = Post.create!(id: 3, author_id: user2.id, title: "Rspec, testing on Ruby", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", comments_counter: 1, likes_counter: 1)
post4 = Post.create!(id: 4, author_id: user3.id, title: "Why Ruby on Rails is great?", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", comments_counter: 1, likes_counter: 6)
post5 = Post.create!(id: 5, author_id: user4.id, title: "Learn how to set up your first app in React", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", comments_counter: 2, likes_counter: 2)
p "Created #{Post.count} Posts"

Comment.create!(id: 1, author_id: user2.id, post_id: post2.id, text: "Wow, great post")
Comment.create!(id: 2, author_id: user1.id, post_id: post3.id, text: "Nice")
Comment.create!(id: 3, author_id: user1.id, post_id: post5.id, text: "Amazing")
Comment.create!(id: 4, author_id: user1.id, post_id: post2.id, text: "Wow, great post")
Comment.create!(id: 5, author_id: user3.id, post_id: post2.id, text: "Nice")
Comment.create!(id: 6, author_id: user3.id, post_id: post5.id, text: "Amazing")
Comment.create!(id: 7, author_id: user3.id, post_id: post1.id, text: "Wow, great post")
Comment.create!(id: 8, author_id: user4.id, post_id: post4.id, text: "Nice")
Comment.create!(id: 9, author_id: user4.id, post_id: post1.id, text: "Amazing")

p "Created #{Comment.count} Comments"
