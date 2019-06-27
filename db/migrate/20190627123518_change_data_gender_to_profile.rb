class ChangeDataGenderToProfile < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :gender, :integer
  end
end
