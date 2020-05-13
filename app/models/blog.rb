# frozen_string_literal: true

class Blog < ApplicationRecord
  # Action text

  has_rich_text :body

  # Active storage

  has_one_attached :cover

  # FriendlyId

  extend FriendlyId

  friendly_id :title, use: :slugged

  # Associations

  belongs_to :user

  has_many :blogs_tags, dependent: :destroy

  has_many :tags, through: :blogs_tags
end
