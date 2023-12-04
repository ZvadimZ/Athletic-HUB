# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

while User.count < 2
  User.create(name: 'Bob', email: 'bobik@email.com')
  User.create(name: 'Rob', email: 'human_temple@email.com')
end

unless Team.any?
  Team.create(name: 'A', max_count: true)
end

unless Event.any?
  Event.create(name:'football', place:'Коммунистический, 25/1', time: '')
end