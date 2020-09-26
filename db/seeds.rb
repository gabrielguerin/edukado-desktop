# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)

# Use faker to seed

require 'faker'

# Delete everything

LevelsPost.delete_all

Level.delete_all

Post.delete_all

Notification.delete_all

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

# Reindex all

User.reindex

Post.reindex

Category.reindex

Subject.reindex

Tag.reindex

Group.reindex

# Create groups

30.times do
  Group.create!(
    name: Faker::University.name
  )
end

# Create subjects

50.times do
  Subject.create!(
    name: Faker::Educator.subject
  )
end

# Create years

years = [

  2015,

  2016,

  2017,

  2018,

  2019,

  2020,

  2021

]

years.each do |year|
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
  user = User.new(
    first_name: Faker::Name.first_name,

    last_name: Faker::Name.last_name,

    gender: Faker::Gender.binary_type,

    email: Faker::Internet.email,

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

20.times do
  Tag.create!(
    title: Faker::Nation.language
  )
end

# Create categories

categories = [

  'Notes de cours',

  'Anciens examens',

  'Travaux pratiques',

  'Résumés',

  'Devoirs Maison',

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

100.times do
  @post = Post.create!(
    user: User.all.sample,

    title: Faker::BossaNova.song,

    description: Faker::Movies::VForVendetta.quote,

    tags: Tag.all.sample(3),

    group: Group.all.sample,

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

# Create comments

100.times do
  Comment.create!(
    user: User.all.sample,

    post: Post.all.sample,

    description: Faker::Lorem.paragraph(sentence_count: 2)
  )
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
