FactoryBot.define do
  factory :user do
    username { Faker::Internet.user_name }
    name { Faker::Name.name }
  end
end
