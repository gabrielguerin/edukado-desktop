# frozen_string_literal: true

class AddGroupToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :group, null: true, foreign_key: true
  end
end
