require 'rails_helper'

RSpec.describe Track, type: :model do
  context "validations" do
    let(:track) { FactoryBot.create(:track) }
    it { expect(track.title).not_to be_nil }
    it { expect(track.icon).not_to be_nil }
  end
end
