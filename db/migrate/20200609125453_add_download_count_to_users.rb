class AddDownloadCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :download_count, :integer
  end
end
