class AddUserIdToProfiles < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM profiles;'
    add_reference :profiles, :user, null: false, index: true
  end
  
  def down
    remove_reference :profiles, :user, index: true
  end
end
