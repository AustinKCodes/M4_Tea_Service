require "rails_helper"

RSpec.describe Customer, type: :model do
  it "should have subscriptions" do
    customer = Customer.new(first_name: "Jan", last_name: "Leigh", email: "test@example.com", address: "123 Tea Lane")

    expect(customer).to be_valid
  end
end