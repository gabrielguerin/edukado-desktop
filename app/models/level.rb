# frozen_string_literal: true

class Level < ApplicationRecord
  # Associations

  has_many :levels_posts, dependent: :destroy

  has_many :posts, through: :levels_posts

  # FriendlyId

  extend FriendlyId

  friendly_id :level, use: :slugged
end
