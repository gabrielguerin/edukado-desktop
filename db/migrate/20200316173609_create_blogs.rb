class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
