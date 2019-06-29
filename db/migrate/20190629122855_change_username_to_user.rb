class ChangeUsernameToUser < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :username, null: false
  end
end
