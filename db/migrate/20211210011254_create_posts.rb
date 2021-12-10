class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      # t.integer :author_id
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.references :post, :post, foreign_key: { to_table: :comments }
      t.references :post, :post, foreign_key: { to_table: :likes }

      t.timestamps
    end
  end
end
