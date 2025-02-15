FactoryBot.define do
  factory :saga do
    user
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    start_date { Date.today }
    end_date { Date.tomorrow }
  end
end
