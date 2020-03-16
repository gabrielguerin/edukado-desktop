# frozen_string_literal: true

class TagsUser < ApplicationRecord
  belongs_to :user
  belongs_to :tag
end
