# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if !User.any?
  User.create(name: 'Пётр Иванов', email: 'petrovich@email.com')
  User.create(name: 'Иван Смирнов', email: 'smirnaga@email.com')
  User.create(name: 'Николай Ростовский', email: 'rostov_papa@email.com')
end

if !Team.any?
  Team.create(name: 'A', max_count: 5, capacity: 1, event_id: 1)
  Team.create(name: 'B', max_count: 5, capacity: 1, event_id: 1)
end

if !Event.any?
  Event.create(id: 1, title:'Футбол', placeUrl:'Коммунистический, 25/1', time: '2023-07-07',
               count_members: 2, user_id: 1)
  Event.create(id: 1, title:'Баскетбол', placeUrl:'проспект Стачки, 158', time: '2023-07-09',
               count_members: 2, user_id: 1)
end

if !TeamMember.any?
  TeamMember.create(user_id: 2, team_id: 1)
  TeamMember.create(user_id: 3, team_id: 2)
  TeamMember.create(user_id: 4, team_id: 1)
  TeamMember.create(user_id: 5, team_id: 2)
  TeamMember.create(user_id: 6, team_id: 2)
end