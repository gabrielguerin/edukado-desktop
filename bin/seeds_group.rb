# Create groups

# French universities

csv_text = File.read(Rails.root.join('lib', 'seeds', 'universities_fr.csv'))

csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')

csv.each do |row|
  t = Group.new

  t.name = row['name']

  t.save
end