class AddPostAssociations < ActiveRecord::Migration
  def change
    remove_column :posts, :name
    add_column :posts, :conference_id, :integer
    add_column :posts, :user_id, :integer
    add_column :posts, :parent_id, :integer
  end
end
