class AddIndexToUsersEmail < ActiveRecord::Migration[7.0]
  def changes
    add_index :users, :email, unique: true
  end
end
