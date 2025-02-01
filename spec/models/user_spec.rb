require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:user) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should have_many(:workouts).dependent(:destroy) }
  end
end
