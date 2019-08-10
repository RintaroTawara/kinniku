class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps null: false
      t.references :user, null: false
      t.string :image_id
      t.integer :likes_count
    end
  end
end
