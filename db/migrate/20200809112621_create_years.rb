class CreateYears < ActiveRecord::Migration[6.0]
  def change
    create_table :years do |t|
      t.integer :start_year
      t.integer :end_year

      t.timestamps
    end
  end
end
