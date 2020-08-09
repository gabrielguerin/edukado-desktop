class AddYearToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :year, null: false, foreign_key: true
  end
end
