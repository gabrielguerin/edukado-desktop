# frozen_string_literal: true

class BlogsTag < ApplicationRecord
  # Associations

  belongs_to :tag

  belongs_to :blog
end
