class AddProfileIdToComments < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM comments;'
    add_reference :comments, :profile, null: false, index: true
  end
  
  def down
    remove_reference :comments, :profile, index: true
  end
end
