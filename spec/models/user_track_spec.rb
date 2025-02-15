require 'rails_helper'

RSpec.describe UserTrack, type: :model do
  context "associations" do
    let(:user_track) do
      user = FactoryBot.build(:valid_user)
      user.save

      user.user_tracks.first
    end

    it { expect(user_track.user).not_to be_nil }
    it { expect(user_track.track).not_to be_nil }
  end
end
