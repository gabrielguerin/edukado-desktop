# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)

# Use faker to seed

require 'faker'

# Seed from a CSV file

require 'csv'

# Delete everything

LevelsPost.delete_all

Level.delete_all

Notification.delete_all

Post.delete_all

User.delete_all

Tag.delete_all

Comment.delete_all

TagsUser.delete_all

PostsTag.delete_all

Blog.delete_all

GroupsSubject.delete_all

Subject.delete_all

Category.delete_all

Year.delete_all

Group.delete_all

# Create groups

# French universities

csv_text = File.read(Rails.root.join('lib', 'seeds', 'universities_fr.csv'))

csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')

csv.take(10).each do |row|
  t = Group.new

  t.name = row['name']

  t.save
end

# Create subjects

50.times do
  Subject.create!(
    name: Faker::Educator.subject
  )
end

# Create years

(2015..2021).each do |year|
  Year.create!(
    start_year: year,

    end_year: year + 1
  )
end

# Create levels

(1..10).each do |level|
  Level.create!(
    level: level
  )
end

# Create users

20.times do
  first_name = Faker::Name.unique.first_name

  last_name = Faker::Name.unique.last_name

  user = User.new(
    first_name: first_name,

    last_name: last_name,

    gender: Faker::Gender.binary_type,

    email: "#{first_name}.#{last_name.strip!}@#{Faker::Internet.domain_name}",

    description: Faker::Lorem.paragraph,

    password: 'password',

    password_confirmation: 'password',

    group: Group.all.sample
  )

  user.skip_confirmation!

  user.save!

  user.add_points(rand(2000))
end

# Create tags

50.times do
  Tag.create!(
    title: Faker::Nation.language
  )
end

# Create categories

categories = [

  'Notes de cours',

  'Annales d\'examens',

  'Travaux pratiques',

  'Résumés',

  'Devoirs maison',

  'Travaux dirigés',

  'Dissertations',

  'Autre'

]

categories.each do |category|
  Category.create!(
    name: category
  )
end

# Create posts

Group.all.each do |group|
  10.times do
    @post = Post.create!(
      user: User.all.sample,

      title: Faker::BossaNova.song,

      description: Faker::Movies::VForVendetta.quote,

      tags: Tag.all.sample(3),

      group: group,

      category: Category.all.sample,

      subject: Subject.all.sample,

      year: Year.all.sample,

      levels: Level.all.sample(1)
    )

    @post.file.attach(
      io: File.open('app/assets/images/seed/SEO.pdf'),

      filename: 'SEO.pdf',

      content_type: 'application/pdf',

      identify: false
    )
  end
end

# Create comments

Post.all.each do |post|
  5.times do
    Comment.create!(
      user: User.all.sample,

      post: post,

      description: Faker::Lorem.paragraph(sentence_count: 2)
    )
  end
end

# Link levels to posts

10.times do
  LevelsPost.create!(
    level: Level.all.sample,

    post: Post.all.sample
  )
end

# Link users to tags

20.times do
  TagsUser.create!(
    user: User.all.sample,

    tag: Tag.all.sample
  )
end

# Link posts to tags

100.times do
  PostsTag.create!(
    post: Post.all.sample,

    tag: Tag.all.sample
  )
end

# Create blogs

50.times do
  @blog = Blog.create!(
    user: User.all.sample,

    title: Faker::BossaNova.song,

    tags: Tag.all.sample(3),

    description: Faker::Movies::VForVendetta.quote,

    body: Faker::Lorem.paragraphs
  )

  @blog.cover.attach(
    io: File.open('app/assets/images/seed/blog_cover.jpg'),

    filename: 'blog_cover.jpg',

    content_type: 'image/jpg',

    identify: false
  )
end

# Link articles to tags

20.times do
  BlogsTag.create!(
    blog: Blog.all.sample,

    tag: Tag.all.sample
  )
end

# Link groups to subjects

40.times do
  GroupsSubject.create!(
    group: Group.all.sample,

    subject: Subject.all.sample
  )
end

# Delete Badges Sash

Merit::BadgesSash.delete_all

# Create superusers

gabriel_guerin_superadmin = User.new(
  first_name: 'Gabriel',

  last_name: 'Guérin',

  gender: 'Masculin',

  email: 'gabriel.guerin@edukado.co',

  password: 'H133J68zTYED%$T2BgM!',

  password_confirmation: 'H133J68zTYED%$T2BgM!',

  group: Group.first,

  superadmin_role: true
)

hugo_pochet_superadmin = User.new(
  first_name: 'Hugo',

  last_name: 'Pochet',

  gender: 'Masculin',

  email: 'hugo.pochet0@gmail.com',

  password: 'FG4U5lK07jbfxIM1Ry*L',

  password_confirmation: 'FG4U5lK07jbfxIM1Ry*L',

  group: Group.first,

  superadmin_role: true
)

# Create supervisor

gabriel_guerin_supervisor = User.new(
  first_name: 'Gabriel',

  last_name: 'Guérin',

  gender: 'Masculin',

  email: 'gabriel.gueringg@gmail.com',

  password: '0a2P$oY7y1E2*09#j4rg',

  password_confirmation: '0a2P$oY7y1E2*09#j4rg',

  group: Group.first,

  supervisor_role: true
)

superusers = [gabriel_guerin_superadmin, hugo_pochet_superadmin, gabriel_guerin_supervisor]

superusers.each do |superuser|
  superuser.skip_confirmation!

  superuser.save!
end
