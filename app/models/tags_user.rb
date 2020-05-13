# frozen_string_literal: true

class TagsUser < ApplicationRecord
  # Associations

  belongs_to :user
  
  belongs_to :tag
end
