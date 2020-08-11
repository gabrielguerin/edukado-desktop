class CreateLevelsPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :levels_posts do |t|
      t.references :level, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
