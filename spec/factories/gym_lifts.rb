FactoryBot.define do
  factory :gym_lift do
    association :exercise
    association :workout
    sets { Faker::Number.between(from: 1, to: 12) }
    reps { Faker::Number.between(from: 1, to: 12) }
    weight { Faker::Number.between(from: 100, to: 200) }
  end
end
