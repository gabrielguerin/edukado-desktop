class ChangeGroupsSubjectsToCourses < ActiveRecord::Migration[6.0]
  def change
    rename_table :groups_subjects, :courses
  end
end
