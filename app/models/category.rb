# frozen_string_literal: true

class Category < ApplicationRecord
  # FriendlyId

  extend FriendlyId

  friendly_id :name, use: :slugged

  # Associations

  has_many :posts
end
