class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter
      
      t.timestamps
    end
    add_foreign_key :posts, :users, column: :author_id
  end
  INSERT INTO posts (id, author_id, title, text, comments_counter, likes_counter, created_at, updated_at)
  VALUES (1, 1, 'my first post', 'dancing its great', 4, 1, '2021-12-14', '2021-12-14');
end
