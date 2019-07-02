class RemoveProfileIdFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :profile_id, :index
  end
end
