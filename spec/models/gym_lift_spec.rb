require 'rails_helper'

RSpec.describe GymLift, type: :model do
  describe "validations" do
    gym_lift = FactoryBot.build(:gym_lift)
    it { expect(gym_lift.reps).to be >= 1 }
    it { expect(gym_lift.sets).to be > 0 }
  end
end
