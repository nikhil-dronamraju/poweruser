FactoryBot.define do
  factory :user do
    username { Faker::Internet.user_name }
    name { Faker::Name.name }
    password { Faker::Internet.password }
    password_digest { BCrypt::Password.create('password') }

    # So setting up the factories is a pain in the ass.
    # This is b/c it attempts to create the
    factory :valid_user do
      tracks { [association(:track)] }
      sagas { [association(:saga)] }
    end
  end


end


