# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Wayaku.delete_all

1.upto(50) do |i|
Wayaku.create! post_id: "#{i}", post_type: 1, 
selected_category: 1, questionBody: "質問内容本文", answer_of_user: "ユーザーが考えた翻訳"
end
