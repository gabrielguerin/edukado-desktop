# frozen_string_literal: true

class Category < ApplicationRecord
  # Search

  searchkick word_start: %i[name]

  # FriendlyId

  extend FriendlyId

  friendly_id :name, use: :slugged

  # Associations

  has_many :posts
  
  # Search data

  def search_data
    {

      name: name

    }
  end
end
