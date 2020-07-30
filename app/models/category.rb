# frozen_string_literal: true

class Category < ApplicationRecord
  # Associations

  has_many :posts
end
