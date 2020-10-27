# frozen_string_literal: true

class Subject < ApplicationRecord
  # Search

  searchkick word_start: %i[name]

  # FriendlyId

  extend FriendlyId

  friendly_id :name, use: :slugged

  # Associations

  has_many :posts

  has_many :courses, dependent: :destroy

  has_many :groups, through: :courses

  # Search data

  def search_data
    {

      name: name

    }
  end
end
