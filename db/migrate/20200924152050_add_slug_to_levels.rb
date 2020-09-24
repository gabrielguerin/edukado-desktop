class AddSlugToLevels < ActiveRecord::Migration[6.0]
  def change
    add_column :levels, :slug, :string
    add_index :levels, :slug, unique: true
  end
end
