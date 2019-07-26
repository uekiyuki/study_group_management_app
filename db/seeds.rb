# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

25.times do |n|
  title = 'test_title' + n.to_s
  content = 'test_content' + n.to_s
  user_id = 3
  Event.create!(title: title, content: content, user_id: user_id)
end

1.times do |n|
  @event = Event.find(1)
  @event.tag_list.add("参加費無料", "期間限定","女子限定","２０代限定","３０代限定")
  @event.save
end
