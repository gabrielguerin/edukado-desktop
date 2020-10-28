# frozen_string_literal: true

class AddCourseToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :course, null: false, foreign_key: true
  end
end
