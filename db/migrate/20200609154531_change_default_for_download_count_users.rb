class ChangeDefaultForDownloadCountUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :download_count, :integer, default: 0
  end
end
