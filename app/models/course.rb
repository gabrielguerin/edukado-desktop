# frozen_string_literal: true

class Course < ApplicationRecord
  # Search

  searchkick word_start: %i[name]

  # FriendlyId

  extend FriendlyId

  friendly_id :name, use: :slugged

  # Associations

  has_many :posts

  belongs_to :group

  belongs_to :subject

  # Search data

  def search_data
    {

      name: name

    }
  end
end
