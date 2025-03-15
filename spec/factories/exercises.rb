FactoryBot.define do
  factory :exercise do
    title { Faker::Alphanumeric.alpha(number: 10) }
    #   Not using any other fields, so for now its fine
  end
end
