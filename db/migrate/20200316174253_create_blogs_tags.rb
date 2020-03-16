# frozen_string_literal: true

class CreateBlogsTags < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs_tags do |t|
      t.belongs_to :blog, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
