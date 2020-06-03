# frozen_string_literal: true

class Comment < ApplicationRecord
  # Active Storage

  has_one_attached :file

  # Associations

  belongs_to :post

  belongs_to :user

  # Vote

  acts_as_votable

  # Validations

  validates :description, length: {

    minimum: 15, too_short: '%<count> caractères est le minimum autorisé',

    maximum: 500, too_long: '%<count> caractères est le maximum autorisé'

  }

  # Like count

  def likes_sum
    get_likes.size
  end

  # Dislike count

  def dislikes_sum
    get_dislikes.size
  end
end
