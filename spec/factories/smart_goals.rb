FactoryBot.define do
  factory :smart_goal do
    track
    measurable_goal { "MyString" }
    start_date { "2025-02-07" }
    end_date { "2025-02-07" }
  end
end
