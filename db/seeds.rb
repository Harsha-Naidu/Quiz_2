# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Idea.delete_all
User.delete_all

NUM_IDEAS=60
NUM_USER=10

PASSWORD='supersecret'
super_user= User.create(
    name: 'Jon Smith',  
    email: 'js@winterfell.gov',
    password: PASSWORD,
    is_admin: true
)


NUM_USER.times do
    name= Faker::Name.name  
    User.create(
        name:name,
        email: "#{name}@example.com",
        password: PASSWORD
    )
    end
    users=User.all


    
NUM_IDEAS.times do
    created_at=Faker::Date.backward(days: 365*5)
    Idea.create(
       title: Faker::Hacker.say_something_smart,
       description: Faker::ChuckNorris.fact,
       created_at: created_at,
       updated_at: created_at,
       user: users.sample
    )
end

idea=Idea.all

puts Cowsay.say("Generated #{idea.count} ideas.",:dragon)
puts Cowsay.say("Generated #{users.count} users.",:frogs)