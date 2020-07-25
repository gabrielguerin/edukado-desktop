# frozen_string_literal: true

class PostsTag < ApplicationRecord
  # Associations

  belongs_to :tag

  belongs_to :post
end
