class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo
      t.text :bio
      t.integer :posts_counter
      
      t.timestamps
    end
  end
  INSERT INTO users (id, name, photo, bio, posts_counter, created_at, updated_at)
  VALUES (1, 'Joseph', 'some link', 'I like to dance', 2, '2021-12-14', '2021-12-14');
end
