class AddJtiToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :jti, :string, null: false
    add_index :users, :jti, unique: true
    User.all.each { |user| user.update_column(:jti, SecureRandom.uuid) }
  end
end
