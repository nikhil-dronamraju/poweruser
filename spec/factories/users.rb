FactoryBot.define do
  factory :user do
    username { Faker::Internet.user_name }
    name { Faker::Name.name }
    password { Faker::Internet.password }
    password_digest { BCrypt::Password.create('password') }

    factory :valid_user do
      tracks { [ association(:track) ] }
      sagas { [ association(:saga) ] }
    end
  end
end
