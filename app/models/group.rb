# frozen_string_literal: true

class Group < ApplicationRecord
  # FriendlyId

  extend FriendlyId

  friendly_id :name, use: :slugged

  # Associations

  has_many :users

  has_many :posts
end
