require "rails_helper"

RSpec.describe "Subscription", type: :model do
  describe "relationships" do
    it { should belongs_to(:customer) }
    it { should belong_to(:tea) }
  end

  describe "validations" do
    it { should validate_presence_of(:sub_name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:status) }
    it { should define_enum_for(:status).with_values([:active, :disabled]) }
    it { should define_enum_for(:frequency).with_values([:weekly, :monthly, :yearly]) }
  end
end