# frozen_string_literal: true

class CreateTagsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :tags_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
