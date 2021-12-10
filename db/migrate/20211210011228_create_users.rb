class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo
      t.text :bio
      t.integer :posts_counter
      t.references :user, :author, foreign_key: { to_table: :posts }
      t.references :user, :author, foreign_key: { to_table: :comments }
      t.references :user, :author, foreign_key: { to_table: :likes }

      t.timestamps
    end
  end
end
