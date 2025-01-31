require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:username) }
    subject { FactoryBot.build(:user) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:name) }
  end
end
