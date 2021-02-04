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

# New user

Merit::Badge.create!(
  id: 1,

  name: 'Nouveau venu',

  description: "S'inscrire sur la plateforme",

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

# Contributor

Merit::Badge.create!(
  id: 2,

  name: 'Contributeur',

  description: 'Contribuer 10 fois sur la plateforme.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 3,

  name: 'Généreux',

  description: 'Contribuer 25 fois sur la plateforme.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 4,

  name: 'Philanthrope',

  description: 'Contribuer 100 fois sur la plateforme.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Voter

Merit::Badge.create!(
  id: 5,

  name: 'Juré',

  description: 'Voter sur 10 publications.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 6,

  name: 'Juge',

  description: 'Voter sur 100 publications.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 7,

  name: 'Devoir civique',

  description: 'Voter sur 500 publications.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Representant

Merit::Badge.create!(
  id: 8,

  name: 'Aimé',

  description: 'Recevoir 10 votes positifs.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 9,

  name: 'Adoré',

  description: 'Recevoir 25 votes positifs.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 10,

  name: 'Révéré',

  description: 'Recevoir 100 votes positifs.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Critic

Merit::Badge.create!(
  id: 11,

  name: 'Critique',

  description: 'Premier vote négatif.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

# Comments

Merit::Badge.create!(
  id: 12,

  name: 'Commentateur',

  description: 'Laisser 10 commentaires.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 13,

  name: 'Présentateur',

  description: 'Laisser 100 commentaires.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 14,

  name: 'Auteur',

  description: 'Laisser 500 commentaires.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Downloads

Merit::Badge.create!(
  id: 15,

  name: 'Téléchargeur',

  description: 'Télécharger 10 fichiers sur la plateforme.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 16,

  name: 'Étudiant',

  description: 'Télécharger 100 fichiers sur la plateforme.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 17,

  name: 'Hacker',

  description: 'Télécharger 500 fichiers sur la plateforme.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Reputation

Merit::Badge.create!(
  id: 18,

  name: 'Héroïque',

  description: 'Avoir plus de 100 points de réputation.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 19,

  name: 'Épique',

  description: 'Avoir plus de 2500 points de réputation.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 20,

  name: 'Légendaire',

  description: 'Avoir plus de 10 000 points de réputation.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Weekly ranking

Merit::Badge.create!(
  id: 21,

  name: 'Top 500 hebdomadaire',

  description: 'Faire partie du top 500 hebdomadaire.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 22,

  name: 'Top 100 hebdomadaire',

  description: 'Faire partie du top 100 hebdomadaire.',

  level: 2,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 23,

  name: 'Top 10 hebdomadaire',

  description: 'Faire partie du top 10 hebdomadaire.',

  level: 3,

  custom_fields: {

    difficulty: 'bronze'

  }
)

# Monthly ranking

Merit::Badge.create!(
  id: 24,

  name: 'Top 500 mensuel',

  description: 'Faire partie du top 500 mensuel.',

  level: 1,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 25,

  name: 'Top 100 mensuel',

  description: 'Faire partie du top 100 mensuel.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 26,

  name: 'Top 10 mensuel',

  description: 'Faire partie du top 10 mensuel.',

  level: 3,

  custom_fields: {

    difficulty: 'silver'

  }
)

# All-time ranking

Merit::Badge.create!(
  id: 27,

  name: 'Top 500 de tous les temps',

  description: 'Faire partie du top 500 de tous les temps.',

  level: 1,

  custom_fields: {

    difficulty: 'gold'

  }
)

Merit::Badge.create!(
  id: 28,

  name: 'Top 100 de tous les temps',

  description: 'Faire partie du top 100 de tous les temps.',

  level: 2,

  custom_fields: {

    difficulty: 'gold'

  }
)

Merit::Badge.create!(
  id: 29,

  name: 'Top 10 de tous les temps',

  description: 'Faire partie du top 10 de tous les temps.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Comments per post

Merit::Badge.create!(
  id: 30,

  name: "Centre d'intérêt",

  description: 'Avoir 10 commentaires sur une publication.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 31,

  name: "Sujet d'actualité",

  description: 'Avoir 25 commentaires sur une publication.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 32,

  name: 'Breaking News',

  description: 'Avoir 100 commentaires sur une publication.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Votes per post

Merit::Badge.create!(
  id: 33,

  name: 'Enseignant',

  description: 'Obtenir 10 votes positifs sur une publication.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 34,

  name: 'Pépite',

  description: 'Obtenir 25 votes positifs sur une publication.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 35,

  name: 'Guru',

  description: 'Avoir 100 votes positifs sur une publication.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Views per post

Merit::Badge.create!(
  id: 36,

  name: 'Publication populaire',

  description: 'Avoir 1000 vues uniques sur une publication.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 37,

  name: 'Publication notable',

  description: 'Avoir 2 500 vues uniques sur une publication.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 38,

  name: 'Publication célèbre',

  description: 'Avoir 10 000 vues uniques sur une publication.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Votes per comment

Merit::Badge.create!(
  id: 39,

  name: 'Commentaire essentiel',

  description: 'Avoir 10 votes positifs sur un commentaire.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 40,

  name: 'Commentaire excellent',

  description: 'Avoir 25 votes positifs sur un commentaire.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 41,

  name: 'Commentaire incroyable',

  description: 'Avoir 100 votes positifs sur un commentaire.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Badges

Merit::Badge.create!(
  id: 42,

  name: 'Badge de bronze',

  description: 'Avoir 80% des badges de bronze.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 43,

  name: "Badge d'argent",

  description: "Avoir 80% des badges d'argent.",

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 44,

  name: "Badge d'or",

  description: "Avoir 80% des badges d'or.",

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Pioneer

Merit::Badge.create!(
  id: 45,

  name: 'Pionnier',

  description: 'Faire partie des 1000 premiers membres de la communauté.',

  level: 1,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Member

Merit::Badge.create!(
  id: 46,

  name: 'VIP',

  description: 'Membre depuis 1 an.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 47,

  name: 'Master',

  description: 'Membre depuis 3 ans.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 48,

  name: 'Légende',

  description: 'Membre depuis 10 ans.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
)

# Autobiographer

Merit::Badge.create!(
  id: 49,

  name: 'Autobiographe',

  description: 'Compléter la partie "À propos" du profil.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

# Help Section

Merit::Badge.create!(
  id: 50,

  name: 'Informé',

  description: 'Lire la page "Notre philoshophie".',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

# Invitations

Merit::Badge.create!(
  id: 51,

  name: 'Amical',

  description: 'Inviter 10 personnes à rejoindre la communauté.',

  level: 1,

  custom_fields: {

    difficulty: 'bronze'

  }
)

Merit::Badge.create!(
  id: 52,

  name: 'Populaire',

  description: 'Inviter 25 personnes à rejoindre la communauté.',

  level: 2,

  custom_fields: {

    difficulty: 'silver'

  }
)

Merit::Badge.create!(
  id: 53,

  name: 'Star',

  description: 'Inviter 100 personnes à rejoindre la communauté.',

  level: 3,

  custom_fields: {

    difficulty: 'gold'

  }
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
