# frozen_string_literal: true



class Blog < ApplicationRecord

  has_rich_text :body

  has_one_attached :cover

  extend FriendlyId

  friendly_id :title, use: :slugged



  belongs_to :user

  has_many :blogs_tags, dependent: :destroy

  has_many :tags, through: :blogs_tags

end

