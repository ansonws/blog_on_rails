# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.delete_all
Post.delete_all

50.times do
    created_at = Faker::Date.backward(365 * 5)
  p = Post.create(
    title: Faker::Nation.capital_city,
    body: Faker::Lorem.paragraph(2),
    created_at: created_at,
    updated_at: created_at
  )
  if p.valid?
    p.comments = rand(0..15).times.map do
      Comment.new(body: Faker::Hipster.sentence)
    end
end
end

posts = Post.all
comments = Comment.all

puts Cowsay.say("Generated #{ posts.count } posts", :ghostbusters)
puts Cowsay.say("Generated #{ comments.count } comments", :stegosaurus)
