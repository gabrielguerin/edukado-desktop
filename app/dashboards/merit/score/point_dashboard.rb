# frozen_string_literal: true

require 'administrate/base_dashboard'
module Merit
  class Score
    class PointDashboard < Administrate::BaseDashboard
      # ATTRIBUTE_TYPES
      # a hash that describes the type of each of the model's fields.
      #
      # Each different type represents an Administrate::Field object,
      # which determines how the attribute is displayed
      # on pages throughout the dashboard.
      ATTRIBUTE_TYPES = {
        score: Field::BelongsTo.with_options(class_name: 'Merit::Score'),
        sash: Field::HasOne.with_options(class_name: 'Merit::Sash'),
        activity_logs: Field::HasMany.with_options(class_name: 'Merit::ActivityLog'),
        id: Field::Number,
        score_id: Field::Number,
        num_points: Field::Number,
        log: Field::String,
        created_at: Field::DateTime
      }.freeze

      # COLLECTION_ATTRIBUTES
      # an array of attributes that will be displayed on the model's index page.
      #
      # By default, it's limited to four items to reduce clutter on index pages.
      # Feel free to add, remove, or rearrange items.
      COLLECTION_ATTRIBUTES = %i[
        score
        sash
        activity_logs
        id
      ].freeze

      # SHOW_PAGE_ATTRIBUTES
      # an array of attributes that will be displayed on the model's show page.
      SHOW_PAGE_ATTRIBUTES = %i[
        score
        sash
        activity_logs
        id
        score_id
        num_points
        log
        created_at
      ].freeze

      # FORM_ATTRIBUTES
      # an array of attributes that will be displayed
      # on the model's form (`new` and `edit`) pages.
      FORM_ATTRIBUTES = %i[
        score
        sash
        activity_logs
        score_id
        num_points
        log
      ].freeze

      # COLLECTION_FILTERS
      # a hash that defines filters that can be used while searching via the search
      # field of the dashboard.
      #
      # For example to add an option to search for open resources by typing "open:"
      # in the search field:
      #
      #   COLLECTION_FILTERS = {
      #     open: ->(resources) { where(open: true) }
      #   }.freeze
      COLLECTION_FILTERS = {}.freeze

      # Overwrite this method to customize how points are displayed
      # across all pages of the admin dashboard.
      #
      # def display_resource(point)
      #   "Merit::Score::Point ##{point.id}"
      # end
    end
  end
end
