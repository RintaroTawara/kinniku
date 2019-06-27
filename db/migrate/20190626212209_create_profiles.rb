class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :nickname, default: "トレーニー"
      t.integer :prefecture
      t.string :gender, null: false, default: 1
      t.date :birthday

      t.timestamps
    end
  end
end
