# frozen_string_literal: true

# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

Merit::Badge.create!(
  id: 1,
  name: 'just-registered',
  description: 'New member',
  custom_fields: { icon_tag: 'user' }
)

# Contributor
Merit::Badge.create!(
  id: 2,
  name: 'contributor',
  description: 'User contributed 1 time to the community.',
  level: 1,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 3,
  name: 'contributor',
  description: 'User contributed 3 times to the community.',
  level: 2,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 4,
  name: 'contributor',
  description: 'User contributed 5 times to the community.',
  level: 3,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 5,
  name: 'contributor',
  description: 'User contributed 10 times to the community.',
  level: 4,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 6,
  name: 'contributor',
  description: 'User contributed 15 times to the community.',
  level: 5,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 7,
  name: 'contributor',
  description: 'User contributed 25 times to the community.',
  level: 6,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 8,
  name: 'contributor',
  description: 'User contributed 50 times to the community.',
  level: 7,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 9,
  name: 'contributor',
  description: 'User contributed 100 times to the community.',
  level: 8,
  custom_fields: { icon_tag: 'star' }
)

# Critic
Merit::Badge.create!(
  id: 10,
  name: 'critic',
  description: 'User commented 1 time.',
  level: 1,
  custom_fields: { icon_tag: 'comments' }
)

Merit::Badge.create!(
  id: 11,
  name: 'critic',
  description: 'User commented 5 times.',
  level: 2,
  custom_fields: { icon_tag: 'comments' }
)

Merit::Badge.create!(
  id: 12,
  name: 'critic',
  description: 'User commented 10 times.',
  level: 3,
  custom_fields: { icon_tag: 'comments' }
)

Merit::Badge.create!(
  id: 13,
  name: 'critic',
  description: 'User commented 25 times.',
  level: 4,
  custom_fields: { icon_tag: 'comments' }
)

Merit::Badge.create!(
  id: 14,
  name: 'critic',
  description: 'User commented 50 times.',
  level: 5,
  custom_fields: { icon_tag: 'comments' }
)

Merit::Badge.create!(
  id: 15,
  name: 'critic',
  description: 'User commented 100 times.',
  level: 6,
  custom_fields: { icon_tag: 'comments' }
)

Merit::Badge.create!(
  id: 16,
  name: 'critic',
  description: 'User commented 250 times.',
  level: 7,
  custom_fields: { icon_tag: 'comments' }
)

Merit::Badge.create!(
  id: 17,
  name: 'critic',
  description: 'User commented 500 times.',
  level: 8,
  custom_fields: { icon_tag: 'comments' }
)

# Judgemental
Merit::Badge.create!(
  id: 18,
  name: 'judgemental',
  description: 'User voted 1 time.',
  level: 1,
  custom_fields: { icon_tag: 'gavel' }
)

Merit::Badge.create!(
  id: 19,
  name: 'judgemental',
  description: 'User voted 3 times.',
  level: 2,
  custom_fields: { icon_tag: 'gavel' }
)

Merit::Badge.create!(
  id: 20,
  name: 'judgemental',
  description: 'El Mundo: User voted 5 times.',
  level: 3,
  custom_fields: { icon_tag: 'gavel' }
)

Merit::Badge.create!(
  id: 21,
  name: 'judgemental',
  description: 'Corriere della Sera: User voted 10 times.',
  level: 4,
  custom_fields: { icon_tag: 'gavel' }
)

Merit::Badge.create!(
  id: 22,
  name: 'judgemental',
  description: 'The Times: User voted 15 times.',
  level: 5,
  custom_fields: { icon_tag: 'gavel' }
)

Merit::Badge.create!(
  id: 23,
  name: 'judgemental',
  description: 'Der Spiegel: User voted 25 times.',
  level: 6,
  custom_fields: { icon_tag: 'gavel' }
)

Merit::Badge.create!(
  id: 24,
  name: 'judgemental',
  description: 'Le Monde: User voted 50 times.',
  level: 7,
  custom_fields: { icon_tag: 'gavel' }
)

Merit::Badge.create!(
  id: 25,
  name: 'judgemental',
  description: 'The New York Times: User voted 100 times.',
  level: 8,
  custom_fields: { icon_tag: 'gavel' }
)

# Liked
Merit::Badge.create!(
  id: 26,
  name: 'liked',
  description: 'User received 1 upvote.',
  level: 1,
  custom_fields: { icon_tag: 'heart' }
)

Merit::Badge.create!(
  id: 27,
  name: 'liked',
  description: 'User received 3 upvotes.',
  level: 2,
  custom_fields: { icon_tag: 'heart' }
)

Merit::Badge.create!(
  id: 28,
  name: 'liked',
  description: 'User received 5 upvotes.',
  level: 3,
  custom_fields: { icon_tag: 'heart' }
)

Merit::Badge.create!(
  id: 29,
  name: 'liked',
  description: 'User received 10 upvotes.',
  level: 4,
  custom_fields: { icon_tag: 'heart' }
)

# Loved
Merit::Badge.create!(
  id: 30,
  name: 'loved',
  description: 'User received 15 upvotes.',
  level: 1,
  custom_fields: { icon_tag: 'grin-hearts' }
)

Merit::Badge.create!(
  id: 31,
  name: 'loved',
  description: 'User received 25 upvotes.',
  level: 2,
  custom_fields: { icon_tag: 'grin-hearts' }
)

Merit::Badge.create!(
  id: 32,
  name: 'loved',
  description: 'User received 50 upvotes.',
  level: 3,
  custom_fields: { icon_tag: 'grin-hearts' }
)

Merit::Badge.create!(
  id: 33,
  name: 'loved',
  description: 'User received 100 upvotes.',
  level: 4,
  custom_fields: { icon_tag: 'grin-hearts' }
)

Merit::Badge.create!(
  id: 34,
  name: 'friendly',
  description: 'User invited 1 person.',
  level: 1,
  custom_fields: { icon_tag: 'glass' }
)

Merit::Badge.create!(
  id: 35,
  name: 'friendly',
  description: 'User invited 3 persons.',
  level: 2,
  custom_fields: { icon_tag: 'glass' }
)

Merit::Badge.create!(
  id: 36,
  name: 'friendly',
  description: 'User invited 5 persons.',
  level: 3,
  custom_fields: { icon_tag: 'glass' }
)

Merit::Badge.create!(
  id: 37,
  name: 'friendly',
  description: 'User invited 10 persons.',
  level: 4,
  custom_fields: { icon_tag: 'glass' }
)

Merit::Badge.create!(
  id: 38,
  name: 'friendly',
  description: 'User invited 15 persons.',
  level: 5,
  custom_fields: { icon_tag: 'glass' }
)

Merit::Badge.create!(
  id: 39,
  name: 'friendly',
  description: 'User invited 25 persons.',
  level: 6,
  custom_fields: { icon_tag: 'glass' }
)

Merit::Badge.create!(
  id: 40,
  name: 'friendly',
  description: 'User invited 50 persons.',
  level: 7,
  custom_fields: { icon_tag: 'glass' }
)

Merit::Badge.create!(
  id: 41,
  name: 'friendly',
  description: 'User invited 100 persons.',
  level: 8,
  custom_fields: { icon_tag: 'glass' }
)

Merit::Badge.create!(
  id: 42,
  name: 'referent',
  description: 'Member since 1 month.',
  level: 1,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 43,
  name: 'referent',
  description: 'Member since 3 months.',
  level: 2,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 44,
  name: 'referent',
  description: 'Member since 6 months.',
  level: 3,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 45,
  name: 'referent',
  description: 'Member since 1 year.',
  level: 4,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 46,
  name: 'referent',
  description: 'Member since 2 years.',
  level: 5,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 47,
  name: 'referent',
  description: 'Member since 3 years.',
  level: 6,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 48,
  name: 'referent',
  description: 'Member since 5 years.',
  level: 7,
  custom_fields: { icon_tag: 'star' }
)

Merit::Badge.create!(
  id: 49,
  name: 'referent',
  description: 'Member since 10 years.',
  level: 8,
  custom_fields: { icon_tag: 'star' }
)

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
