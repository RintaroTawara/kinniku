class AddImageIdToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :image_id, :string
  end
end
