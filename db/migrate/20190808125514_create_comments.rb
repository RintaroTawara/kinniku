class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :post, null: false
      t.timestamps null: false
      t.references :user, null: false
      t.string :content

    end
  end
end
