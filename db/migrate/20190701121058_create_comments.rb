class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :conternt
      t.references :profile
      t.references :post

      t.timestamps
    end
  end
end
