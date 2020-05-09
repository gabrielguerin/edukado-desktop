# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post

  belongs_to :user

  acts_as_votable

  validates :description, length: {

    minimum: 1, too_short: '%<count> caractères est le minimum autorisé',

    maximum: 500, too_long: '%<count> caractères est le maximum autorisé'

  }

  def likes_sum
    get_likes.size
  end

  def dislikes_sum
    get_dislikes.size
  end
end
