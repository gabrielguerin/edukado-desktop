# frozen_string_literal: true

class CreatePostsTags < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_tags do |t|
      t.belongs_to :post, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
