require "administrate/base_dashboard"

class PostsTagDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES

  # a hash that describes the type of each of the model's fields.

  # Each different type represents an Administrate::Field object,

  # which determines how the attribute is displayed

  # on pages throughout the dashboard.

  ATTRIBUTE_TYPES = {

    tag: Field::BelongsTo,

    post: Field::BelongsTo,

    id: Field::Number,

    created_at: Field::DateTime.with_options(format: "%-d %B %Y"),

    updated_at: Field::DateTime.with_options(format: "%-d %B %Y")

  }.freeze

  # COLLECTION_ATTRIBUTES

  # an array of attributes that will be displayed on the model's index page.

  # By default, it's limited to four items to reduce clutter on index pages.

  # Feel free to add, remove, or rearrange items.

  COLLECTION_ATTRIBUTES = %i[

    id

    tag

    post

  ].freeze

  # SHOW_PAGE_ATTRIBUTES

  # an array of attributes that will be displayed on the model's show page.

  SHOW_PAGE_ATTRIBUTES = %i[

    tag

    post

    created_at

    updated_at

  ].freeze

  # FORM_ATTRIBUTES

  # an array of attributes that will be displayed

  # on the model's form (`new` and `edit`) pages.

  FORM_ATTRIBUTES = %i[

    tag

    post

  ].freeze

  # COLLECTION_FILTERS

  # a hash that defines filters that can be used while searching via the search

  # field of the dashboard.

  # For example to add an option to search for open resources by typing "open:"

  # in the search field:

  #   COLLECTION_FILTERS = {

  #     open: ->(resources) { where(open: true) }

  #   }.freeze

  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how post tags are displayed

  # across all pages of the admin dashboard.

  # def display_resource(post_tag)

  #   "PostsTag ##{post_tag.id}"

  # end
end
