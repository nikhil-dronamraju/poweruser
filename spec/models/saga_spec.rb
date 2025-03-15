require 'rails_helper'

RSpec.describe Saga, type: :model do
  context "validations" do
    let(:saga) do
      user = FactoryBot.build(:valid_user)
      user.save

      user.sagas.first
    end

    it { expect(saga.title.length).to be > 0 }
    it { expect(saga.content.length).to be > 0 }
    it { expect(saga.start_date).not_to be_nil }
    it { expect(saga.end_date).not_to be_nil }
    it { expect(saga.end_date).to be > saga.start_date }
  end
end
