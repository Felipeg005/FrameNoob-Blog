class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :post_id
      t.text :text

      t.timestamps
    end
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts, column: :post_id
  end
  INSERT INTO comments (id, author_id, post_id, text, created_at, updated_at)
  VALUES (1, 1, 1, 'wow nice post', '2021-12-14', '2021-12-14');
end
