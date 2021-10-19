# frozen_string_literal: true

# Seed posts

csv_text = File.read(Rails.root.join('lib', 'seeds', 'posts', 'sciences_po_strasbourg.csv'))

csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1', col_sep: ';')

csv.each do |row|
  p row

  # byebug

  post = Post.new

  post.user = User.find_by(email: row['email'])

  post.title = row['title']

  post.description = row['description']

  post.tags = row['tag_list'].split(',').map do |title|
    Tag.where(title: title.strip).first_or_create!
  end

  post.group = Group.find_by(name: row['group'])

  post.course = Course.find_by(name: row['course'])

  post.levels = row['levels'].split(',').map do |level|
    Level.find_by(level: level)
  end

  post.category = Category.find_by(name: row['category'])

  post.year = Year.find_by(start_year: row['start_year'], end_year: row['end_year'])

  post.file.attach(
    io: File.open(row['path']),

    filename: row['filename'],

    content_type: row['content_type'],

    identify: row['identity']
  )

  post.save
end
