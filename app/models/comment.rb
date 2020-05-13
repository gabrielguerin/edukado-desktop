# frozen_string_literal: true



class Comment < ApplicationRecord

  # Associations



  belongs_to :post



  belongs_to :user



  # Vote



  acts_as_votable



  # Validations



  validates :description, length: {



    minimum: 1, too_short: '%<count> caractères est le minimum autorisé',



    maximum: 500, too_long: '%<count> caractères est le maximum autorisé'



  }



  # Sum of likes



  def likes_sum

    get_likes.size

  end



  # Sum of dislikes



  def dislikes_sum

    get_dislikes.size

  end

end

