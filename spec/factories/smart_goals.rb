FactoryBot.define do
  factory :smart_goal do
    user_track { nil }
    measurable_goal { "MyString" }
    start_date { "2025-02-07" }
    end_date { "2025-02-07" }
  end
end
