# frozen_string_literal: true

class Subject < ApplicationRecord
  # Search

  searchkick word_start: %i[name]

  # FriendlyId

  extend FriendlyId

  friendly_id :name, use: :slugged
  
  # Associations

  has_many :posts

  has_many :groups_subjects, dependent: :destroy

  has_many :groups, through: :groups_subjects

  # Search data

  def search_data
    {

      name: name

    }
  end  
end
