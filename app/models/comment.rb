# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  acts_as_votable
  validates :description, length: {
    maximum: 500, too_long: '%<count> caractères est le maximum autorisé'
  }
end
