require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    let(:valid_user) do
      user = FactoryBot.build(:valid_user)
      user.save

      user
    end
    it { expect(valid_user.username).not_to be_empty }
    it "validates username uniqueness" do
      user_two = valid_user.dup
      user_two.save
      expect(user_two.errors.messages.values.flatten).to include("Username already taken")
    end
    it { expect(valid_user.name).not_to be_empty }
    it { expect(valid_user.password_digest).not_to be_empty }
    it { expect(valid_user.tracks.count).to be > 0 }
    it { expect(valid_user.sagas.count).to be > 0 }
  end

  context "Error messages" do
    let(:invalid_user) {
      user = FactoryBot.build(:user, name: nil, username: nil, password_digest: nil)
      user.save

      user
    }
    it { expect(invalid_user.errors.messages.values.flatten).to eq([ "Must enter a username", "Must enter a name", "Must select at least one track.", "Must have at least one saga." ]) }
  end
end
