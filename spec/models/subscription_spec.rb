require "rails_helper"

RSpec.describe "Subscription", type: :model do
  describe "relationships" do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
  end

  describe "validations" do
    it { should validate_presence_of(:sub_name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:status) }
    it { should define_enum_for(:status).with_values([:active, :disabled]) }
    it { should define_enum_for(:frequency).with_values([:weekly, :monthly, :yearly]) }
  end

  it "should have valid attributes" do
    customer = Customer.create!(first_name: "Jan", last_name: "Leigh", email: "test@example.com", address: "123 Tea Lane")
    tea = Tea.new(tea_name: "Green Tea", description: "Green tea", temperature: 80, brew_time: 3)
    subscription = Subscription.new(
      sub_name: "Monthly Green Tea",
      price: 9.99,
      status: 1,
      frequency: 1,
      customer: customer,
      tea: tea,
    )
    expect(subscription).to be_valid
  end
end