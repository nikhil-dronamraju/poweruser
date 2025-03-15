FactoryBot.define do
  factory :workout do
    parts_hit { Faker::Lorem.word }
    association :user
    workout_type { Faker::Number.between(from: 1, to: 3) }
  end
end
