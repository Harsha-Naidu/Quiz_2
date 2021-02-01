RANDOM_HUNDRED_CHARS="hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello worldhello world"


FactoryBot.define do
  factory :idea do
    sequence(:title){ |n| Faker::Job.title + "#{n}"}
    description{ Faker::Job.field + "#{RANDOM_HUNDRED_CHARS}"}
  end
end
