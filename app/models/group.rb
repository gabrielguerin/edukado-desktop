# frozen_string_literal: true

class Group < ApplicationRecord
  # Search

  searchkick word_start: %i[name]

  # FriendlyId

  extend FriendlyId

  friendly_id :name, use: :slugged

  # Associations

  has_many :users

  has_many :posts

  has_many :groups_subjects, dependent: :destroy

  has_many :subjects, through: :groups_subjects


  # Search data

  def search_data
    {

      name: name

    }.merge(

      post: posts.map(&:title)

    )
  end
end
