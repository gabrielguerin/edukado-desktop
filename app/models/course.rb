class Course < ApplicationRecord
  # Associations

  belongs_to :group

  belongs_to :subject
end
