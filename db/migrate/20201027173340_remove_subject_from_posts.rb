class RemoveSubjectFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :posts, :subject, null: false, foreign_key: true
  end
end
