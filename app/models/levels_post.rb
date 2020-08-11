# frozen_string_literal: true

class LevelsPost < ApplicationRecord
  # Associations

  belongs_to :level

  belongs_to :post
end
