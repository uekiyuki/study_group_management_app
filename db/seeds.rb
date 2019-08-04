# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テストユーザを作成
  name = 'test user'
  email = 'tabuchi@dic.com'
  password = 'tabuchi'
  password_confirmation = 'tabuchi'
  User.create!(name: name, email: email, password: password, password_confirmation: password_confirmation)

# イベントを作成
10.times do |n|
  title = 'test title ' + n.to_s
  content = 'test content ' + n.to_s
  location = 'somewhere in Tokyo ' + n.to_s
  price = 1_000
  event_at = '2019-10-01'
  capacity = 5
  user_id = User.find_by(email: 'tabuchi@dic.com').id

  Event.create!(title: title,
                content: content,
                location: location,
                price: price,
                event_at: event_at,
                capacity: capacity,
                user_id: user_id)
end

# タグを作成
1.times do |n|
  event = Event.find(1)
  event.tag_list.add("参加費無料", "期間限定","女子限定","２０代限定","３０代限定")
  event.save
end
