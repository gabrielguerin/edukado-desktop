# frozen_string_literal: true

class Subject < ApplicationRecord
  # Associations

  has_many :groups_subjects, dependent: :destroy

  has_many :groups, through: :groups_subjects
end
