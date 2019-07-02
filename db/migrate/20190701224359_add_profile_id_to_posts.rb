class AddProfileIdToPosts < ActiveRecord::Migration[5.2]
  def change
    def up
      execute 'DELETE FROM posts;'
      add_reference :posts, :profile, null: false, index: true
    end
    
    def down
      remove_reference :posts, :profile, index: true
    end
  end
end
