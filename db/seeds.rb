# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(id: 1, name: "Rudolph", photo: "link#", bio: "I love dancing", posts_counter: 0, email: "1@gmail.com", password: "1234567")
User.create(id: 2, name: "Stella", photo: "link#", bio: "I love hiking", posts_counter: 0, email: "2@gmail.com", password: "1234567")
User.create(id: 3, name: "Bill", photo: "link#", bio: "My favorite movie its Pan's Labyrinth", posts_counter: 0, email: "3@gmail.com", password: "1234567")
User.create(id: 4, name: "Elisa", photo: "link#", bio: "Life is wonderful, I'm here to learn", posts_counter: 0, email: "4@gmail.com", password: "1234567")

Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
Post.create(id: 2, author_id: 2, title: 'I like react', text: 'Great framework', comments_counter: 0, likes_counter: 0)
Post.create(id: 3, author_id: 3, title: 'I like redux', text: 'Great framework', comments_counter: 0, likes_counter: 0)
Post.create(id: 4, author_id: 4, title: 'I like jest', text: 'Great framework', comments_counter: 0, likes_counter: 0)
