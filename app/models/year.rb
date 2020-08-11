# frozen_string_literal: true

class Year < ApplicationRecord
  # Associations

  has_many :years

  # Year

  def year
    "#{start_year}/#{end_year}"
  end
end
