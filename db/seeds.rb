# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(id: 1, name: "Rudolph", photo: "link#", bio: "I love dancing", posts_counter: 2)
user2 = User.create(id: 2, name: "Mike", photo: "link#", bio: "I love hiking", posts_counter: 0)
p "Created #{User.count} Users"

post1 = Post.create!(id: 1, author_id: user1.id, title: "my first post", text: "dancing its great", comments_counter: 1, likes_counter: 2)
post2 = Post.create!(id: 2, author_id: user1.id, title: "my second post", text: "dancing its the best for me", comments_counter: 4, likes_counter: 1)
p "Created #{Post.count} Posts"

Comment.create!(id: 1, author_id: user1.id, post_id: post2.id, text: "Wow, great post")
p "Created #{Comment.count} Comments"
