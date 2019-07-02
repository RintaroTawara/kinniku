class RemoveCnterntFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :conternt, :string
  end
end
