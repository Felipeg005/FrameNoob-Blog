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
end