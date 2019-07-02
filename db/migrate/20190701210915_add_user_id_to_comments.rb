class AddUserIdToComments < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM comments;'
    add_reference :comments, :user, null: false, index: true
  end
  
  def down
    remove_reference :comments, :user, index: true
  end
end
