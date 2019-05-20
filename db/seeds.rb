# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.delete_all
Post.delete_all

10.times do
    User.create(
      name: Faker::Name.unique.name,
      email: "#{Faker::Name.first_name.downcase}.#{Faker::Name.last_name.downcase}@example.com",
      password: "super"
    )
end
  
users = User.all

50.times do
    created_at = Faker::Date.backward(365 * 5)
  p = Post.create(
    title: Faker::Nation.capital_city,
    body: Faker::Lorem.paragraph(2),
    created_at: created_at,
    updated_at: created_at,
    user: users.sample
  )
  if p.valid?
    p.comments = rand(0..15).times.map do
      Comment.new(body: Faker::Hipster.sentence, user: users.sample)
    end
end
end

posts = Post.all
comments = Comment.all

puts Cowsay.say("Generated #{ posts.count } posts", :ghostbusters)
puts Cowsay.say("Generated #{ comments.count } comments", :stegosaurus)
