# frozen_string_literal: true

class PostsTag < ApplicationRecord
  belongs_to :tag
  belongs_to :post
end
