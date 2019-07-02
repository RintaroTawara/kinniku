class ChangeDataPrefectureToProfiles < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :prefecture, :string
  end
end
