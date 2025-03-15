require 'rails_helper'

RSpec.describe Workout, type: :model do
  describe "assocations" do
    it { should have_many(:gym_lifts).dependent(:destroy) }
    it { should belong_to(:user) }
  end
end
