# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
      t.text :description
      t.timestamps
    end
  end
end
