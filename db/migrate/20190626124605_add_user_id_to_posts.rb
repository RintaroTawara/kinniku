class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM posts;'
    add_reference :posts, :user, null: false, index: true
  end
  
  def down
    remove_reference :tasks, :user, index: true
  end
end
