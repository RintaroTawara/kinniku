class RemovePlaceFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :place, :string
  end
end
